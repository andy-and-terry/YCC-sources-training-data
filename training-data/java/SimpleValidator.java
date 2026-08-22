import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import java.util.regex.Pattern;

public class SimpleValidator {
    static class ValidationException extends RuntimeException {
        final Map<String, List<String>> errors;

        ValidationException(Map<String, List<String>> errors) {
            super(errors.toString());
            this.errors = errors;
        }
    }

    static final Predicate<String> REQUIRED = value -> value != null && !value.isEmpty();
    static final Predicate<String> IS_EMAIL = value ->
        value != null && Pattern.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$", value);

    static Predicate<String> minLength(int n) {
        return value -> value != null && value.length() >= n;
    }

    public static void validate(Map<String, String> data, Map<String, List<Predicate<String>>> schema) {
        Map<String, List<String>> errors = new LinkedHashMap<>();
        for (Map.Entry<String, List<Predicate<String>>> entry : schema.entrySet()) {
            String field = entry.getKey();
            for (Predicate<String> rule : entry.getValue()) {
                if (!rule.test(data.get(field))) {
                    errors.computeIfAbsent(field, f -> new ArrayList<>()).add("invalid");
                }
            }
        }
        if (!errors.isEmpty()) throw new ValidationException(errors);
    }

    public static void main(String[] args) {
        Map<String, String> data = Map.of("email", "not-an-email", "password", "short");
        Map<String, List<Predicate<String>>> schema = Map.of(
            "email", List.of(REQUIRED, IS_EMAIL),
            "password", List.of(REQUIRED, minLength(8))
        );
        try {
            validate(data, schema);
        } catch (ValidationException e) {
            System.out.println(e.errors);
        }
    }
}
