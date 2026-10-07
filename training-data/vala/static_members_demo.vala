class IdGenerator {
    private static int next_id = 1;
    public static const int MAX_IDS = 1000;

    public int id;

    public IdGenerator() {
        id = next_id++;
    }

    public static int issued() {
        return next_id - 1;
    }

    public static string describe(int n) {
        return "id-%04d".printf(n);
    }
}

void main() {
    var a = new IdGenerator();
    var b = new IdGenerator();
    var c = new IdGenerator();
    stdout.printf("%d %d %d\n", a.id, b.id, c.id);
    stdout.printf("issued: %d of %d\n", IdGenerator.issued(), IdGenerator.MAX_IDS);
    stdout.printf("%s\n", IdGenerator.describe(c.id));
}
