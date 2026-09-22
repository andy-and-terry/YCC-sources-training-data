public class TextBlockDemo {
    record Invoice(String customer, int itemCount, double total) {}

    static String render(Invoice invoice) {
        String template = """
            Invoice for: %s
            Items: %d
            Total: $%.2f
            """;
        return template.formatted(invoice.customer(), invoice.itemCount(), invoice.total());
    }

    public static void main(String[] args) {
        String json = """
            {
              "status": "ok",
              "code": 200
            }""";
        System.out.println(json);

        String sql = """
            SELECT id, name
            FROM users
            WHERE active = true""";
        System.out.println(sql);

        System.out.print(render(new Invoice("Bob", 3, 42.5)));
    }
}
