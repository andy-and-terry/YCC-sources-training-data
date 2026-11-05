public class TextBlockFormattedDemo {
    public static void main(String[] args) {
        String json = """
            {
              "name": "%s",
              "age": %d
            }
            """.formatted("Ann", 30);
        System.out.print(json);
        System.out.println(json.lines().count());
    }
}
