public class TextBlockAndRecords {
    record Point(int x, int y) {
        Point {
            if (x < 0 || y < 0) throw new IllegalArgumentException("negative");
        }
        double distance() { return Math.sqrt(x * x + y * y); }
    }

    public static void main(String[] args) {
        String json = """
            {
              "name": "text block",
              "ok": true
            }
            """;
        System.out.print(json);
        Point p = new Point(3, 4);
        System.out.println(p + " " + p.distance());
    }
}
