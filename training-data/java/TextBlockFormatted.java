public class TextBlockFormatted {
    public static void main(String[] args) {
        String json = """
            {
              "name": "%s",
              "age": %d
            }
            """.formatted("Ann", 30);
        System.out.print(json);
        System.out.println("a\nb\nc".lines().count());
        System.out.println("  hi  ".strip() + "|" + "ab".repeat(3) + "|" + " ".isBlank());
    }
}
