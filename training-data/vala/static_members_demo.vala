class IdGenerator {
    private static int next_id = 1;
    public const string PREFIX = "ID";

    public int id;

    public IdGenerator () {
        this.id = next_id++;
    }

    public static int issued () {
        return next_id - 1;
    }

    public string label () {
        return "%s-%03d".printf (PREFIX, id);
    }
}

class MathUtil {
    public static int clamp_int (int v, int lo, int hi) {
        return v < lo ? lo : (v > hi ? hi : v);
    }
}

void main () {
    var a = new IdGenerator ();
    var b = new IdGenerator ();
    var c = new IdGenerator ();
    print ("%s %s %s\n", a.label (), b.label (), c.label ());
    print ("issued: %d\n", IdGenerator.issued ());
    print ("%d %d %d\n", MathUtil.clamp_int (-5, 0, 10), MathUtil.clamp_int (5, 0, 10), MathUtil.clamp_int (50, 0, 10));
}
