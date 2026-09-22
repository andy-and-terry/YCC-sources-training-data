import java.util.List;

public class PatternMatchingInstanceofDemo {
    static String describe(Object obj) {
        if (obj instanceof String s && !s.isEmpty()) {
            return "non-empty string of length " + s.length();
        } else if (obj instanceof String s) {
            return "empty string";
        } else if (obj instanceof Integer i && i > 0) {
            return "positive integer " + i;
        } else if (obj instanceof Integer i) {
            return "non-positive integer " + i;
        } else if (obj instanceof List<?> list && !list.isEmpty()) {
            return "list with " + list.size() + " elements";
        } else if (obj == null) {
            return "null value";
        }
        return "unknown type: " + obj.getClass().getSimpleName();
    }

    public static void main(String[] args) {
        Object[] values = {"hello", "", -5, 42, List.of(1, 2, 3), List.of(), null, 3.14};
        for (Object v : values) {
            System.out.println(describe(v));
        }
    }
}
