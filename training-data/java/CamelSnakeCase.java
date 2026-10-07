import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

public class CamelSnakeCase {
    public static List<String> words(String s) {
        String spaced = s.replaceAll("([a-z0-9])([A-Z])", "$1 $2").replaceAll("([A-Z]+)([A-Z][a-z])", "$1 $2");
        return Arrays.stream(spaced.split("[\\s_\\-]+")).filter(w -> !w.isEmpty()).map(w -> w.toLowerCase(Locale.ROOT)).toList();
    }

    private static String cap(String w) {
        return w.isEmpty() ? w : Character.toUpperCase(w.charAt(0)) + w.substring(1);
    }

    public static String toCamel(String s) {
        List<String> w = words(s);
        return w.get(0) + w.stream().skip(1).map(CamelSnakeCase::cap).collect(Collectors.joining());
    }

    public static String toSnake(String s) {
        return String.join("_", words(s));
    }

    public static String toConstant(String s) {
        return toSnake(s).toUpperCase(Locale.ROOT);
    }

    public static void main(String[] args) {
        for (String s : new String[] {"parseHTTPResponse", "user_id", "background-color", "XMLHttpRequest"}) {
            System.out.printf("%-18s camel=%-18s snake=%-20s const=%s%n", s, toCamel(s), toSnake(s), toConstant(s));
        }
    }
}
