class IdGenerator : Object {
    private static int next_id = 1;
    public static int created = 0;

    public int id { get; private set; }

    public IdGenerator() {
        id = next_id++;
        created++;
    }

    public static int peek_next() {
        return next_id;
    }

    public static void reset() {
        next_id = 1;
        created = 0;
    }
}

class MathUtil {
    public const double TAU = 6.283185307179586;
    public const int MAX_ITEMS = 100;

    public static int clamp(int v, int lo, int hi) {
        return v < lo ? lo : (v > hi ? hi : v);
    }

    public static bool is_power_of_two(int n) {
        return n > 0 && (n & (n - 1)) == 0;
    }
}

void main() {
    var a = new IdGenerator();
    var b = new IdGenerator();
    var c = new IdGenerator();
    stdout.printf("ids: %d %d %d\n", a.id, b.id, c.id);
    stdout.printf("created: %d, next: %d\n", IdGenerator.created, IdGenerator.peek_next());

    IdGenerator.reset();
    var d = new IdGenerator();
    stdout.printf("after reset: %d\n", d.id);

    stdout.printf("clamp: %d %d %d\n",
        MathUtil.clamp(-5, 0, 10), MathUtil.clamp(5, 0, 10), MathUtil.clamp(50, 0, 10));
    stdout.printf("pow2: %s %s\n",
        MathUtil.is_power_of_two(64).to_string(), MathUtil.is_power_of_two(65).to_string());
    stdout.printf("TAU = %.4f, MAX = %d\n", MathUtil.TAU, MathUtil.MAX_ITEMS);
}
