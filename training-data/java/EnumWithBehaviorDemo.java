import java.util.EnumMap;
import java.util.EnumSet;

public class EnumWithBehaviorDemo {
    enum Op {
        ADD("+") { int apply(int a, int b) { return a + b; } },
        SUB("-") { int apply(int a, int b) { return a - b; } },
        MUL("*") { int apply(int a, int b) { return a * b; } };

        final String symbol;
        Op(String symbol) { this.symbol = symbol; }
        abstract int apply(int a, int b);
    }

    public static void main(String[] args) {
        for (Op op : Op.values()) {
            System.out.println("6 " + op.symbol + " 3 = " + op.apply(6, 3));
        }
        EnumMap<Op, Integer> uses = new EnumMap<>(Op.class);
        uses.merge(Op.ADD, 1, Integer::sum);
        uses.merge(Op.ADD, 1, Integer::sum);
        System.out.println(uses);
        System.out.println(EnumSet.complementOf(EnumSet.of(Op.ADD)));
        System.out.println(Op.valueOf("MUL").ordinal());
    }
}
