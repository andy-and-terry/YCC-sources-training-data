public class EnumWithAbstractMethod {
    enum Op {
        ADD("+") { int apply(int a, int b) { return a + b; } },
        MUL("*") { int apply(int a, int b) { return a * b; } };

        final String symbol;
        Op(String symbol) { this.symbol = symbol; }
        abstract int apply(int a, int b);
    }

    public static void main(String[] args) {
        for (Op op : Op.values()) System.out.println(3 + " " + op.symbol + " " + 4 + " = " + op.apply(3, 4));
    }
}
