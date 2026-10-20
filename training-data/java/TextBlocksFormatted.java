public class TextBlocksFormatted {
    public static void main(String[] args) {
        String json = """
            {
              "name": "%s",
              "age": %d
            }
            """.formatted("Ada", 36);
        System.out.print(json);
        System.out.println("a,b,,c".split(",").length);
    }
}
