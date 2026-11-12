public class TextBlockAndFormatted {
    public static void main(String[] args) {
        String json = """
            {"name": "%s", "n": %d}
            """.formatted("x", 5);
        System.out.print(json);
    }
}
