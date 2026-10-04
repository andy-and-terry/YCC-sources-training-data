class IdGenerator {
    private static int next_id = 1;
    public const string PREFIX = "ID-";

    public static string generate () {
        return "%s%04d".printf (PREFIX, next_id++);
    }

    public static void reset () {
        next_id = 1;
    }
}

class MathUtil {
    public static int clamp (int v, int lo, int hi) {
        return v < lo ? lo : (v > hi ? hi : v);
    }
}

void main () {
    stdout.printf ("%s\n", IdGenerator.generate ());
    stdout.printf ("%s\n", IdGenerator.generate ());
    IdGenerator.reset ();
    stdout.printf ("%s\n", IdGenerator.generate ());
    stdout.printf ("%d %d %d\n",
                   MathUtil.clamp (-5, 0, 10),
                   MathUtil.clamp (5, 0, 10),
                   MathUtil.clamp (50, 0, 10));
}
