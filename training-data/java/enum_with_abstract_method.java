public class EnumWithAbstractMethod {
    enum Op {
        ADD("+") { int apply(int a, int b) { return a + b; } },
        MUL("*") { int apply(int a, int b) { return a * b; } };

        final String sym;
        Op(String s) { sym = s; }
        abstract int apply(int a, int b);
    }

    public static void main(String[] args) {
        for (Op o : Op.values())
            System.out.println(o + " " + o.sym + " " + o.apply(3, 4));
    }
}
