public class EnumAbstractMethodDemo {
    enum Op {
        ADD("+") { public int apply(int a, int b) { return a + b; } },
        SUB("-") { public int apply(int a, int b) { return a - b; } },
        MUL("*") { public int apply(int a, int b) { return a * b; } };

        private final String symbol;
        Op(String symbol) { this.symbol = symbol; }
        public abstract int apply(int a, int b);
        public String symbol() { return symbol; }
    }

    public static void main(String[] args) {
        for (Op op : Op.values()) {
            System.out.println("6 " + op.symbol() + " 3 = " + op.apply(6, 3));
        }
        System.out.println(Op.valueOf("MUL").ordinal());
    }
}
