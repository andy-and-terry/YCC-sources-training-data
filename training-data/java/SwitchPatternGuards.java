public class SwitchPatternGuards {
    static String describe(Object o) {
        return switch (o) {
            case Integer i when i > 100 -> "big int";
            case Integer i -> "int " + i;
            case String s when s.isEmpty() -> "empty string";
            case String s -> "string " + s;
            case null -> "null";
            default -> "other";
        };
    }

    public static void main(String[] args) {
        for (Object o : new Object[] { 5, 500, "", "hi", 2.0, null }) System.out.println(describe(o));
    }
}
