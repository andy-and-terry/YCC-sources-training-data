public class TextBlockDemo {
    public static void main(String[] args) {
        String json = """
            {
              "name": "%s",
              "age": %d
            }
            """.formatted("Ann", 30);
        System.out.print(json);
    }
}
