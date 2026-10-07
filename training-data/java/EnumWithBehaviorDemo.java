import java.util.EnumMap;
import java.util.Map;

public class EnumWithBehaviorDemo {
    enum Operation {
        ADD("+") {
            double apply(double a, double b) { return a + b; }
        },
        SUBTRACT("-") {
            double apply(double a, double b) { return a - b; }
        },
        MULTIPLY("*") {
            double apply(double a, double b) { return a * b; }
        },
        DIVIDE("/") {
            double apply(double a, double b) { return a / b; }
        };

        private final String symbol;

        Operation(String symbol) { this.symbol = symbol; }

        abstract double apply(double a, double b);

        String symbol() { return symbol; }
    }

    public static void main(String[] args) {
        for (Operation op : Operation.values()) {
            System.out.printf("8 %s 2 = %.1f%n", op.symbol(), op.apply(8, 2));
        }

        Map<Operation, Integer> usage = new EnumMap<>(Operation.class);
        usage.merge(Operation.ADD, 1, Integer::sum);
        usage.merge(Operation.ADD, 1, Integer::sum);
        usage.merge(Operation.DIVIDE, 1, Integer::sum);
        System.out.println(usage);
        System.out.println(Operation.valueOf("MULTIPLY").ordinal());
    }
}
