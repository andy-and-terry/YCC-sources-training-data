public class TextBlockJson {
    public static void main(String[] args) {
        String name = "Ada";
        String json = """
            {
              "name": "%s",
              "langs": ["java", "c"]
            }
            """.formatted(name);
        System.out.print(json);
    }
}
