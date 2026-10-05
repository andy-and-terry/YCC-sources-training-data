import java.util.EnumMap;
import java.util.Map;

public class EnumWithAbstractMethods {
    enum Operation {
        ADD("+") { double apply(double a, double b) { return a + b; } },
        SUB("-") { double apply(double a, double b) { return a - b; } },
        MUL("*") { double apply(double a, double b) { return a * b; } },
        DIV("/") { double apply(double a, double b) { return a / b; } };

        private final String symbol;

        Operation(String symbol) { this.symbol = symbol; }

        abstract double apply(double a, double b);

        String symbol() { return symbol; }
    }

    public static void main(String[] args) {
        Map<Operation, Double> results = new EnumMap<>(Operation.class);
        for (Operation op : Operation.values()) {
            results.put(op, op.apply(12, 4));
            System.out.println("12 " + op.symbol() + " 4 = " + results.get(op));
        }
    }
}
