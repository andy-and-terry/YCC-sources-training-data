public class TextBlockFormatted {
    public static void main(String[] args) {
        String json = """
            {
              "name": "%s",
              "age": %d
            }
            """.formatted("ann", 30);
        System.out.print(json);
    }
}
