import java.util.Map;

public class InterpreterPattern {
    interface Expression {
        int interpret(Map<String, Integer> context);
    }

    static class Number implements Expression {
        private final int value;

        Number(int value) {
            this.value = value;
        }

        public int interpret(Map<String, Integer> context) {
            return value;
        }
    }

    static class Variable implements Expression {
        private final String name;

        Variable(String name) {
            this.name = name;
        }

        public int interpret(Map<String, Integer> context) {
            return context.getOrDefault(name, 0);
        }
    }

    static class Add implements Expression {
        private final Expression left, right;

        Add(Expression left, Expression right) {
            this.left = left;
            this.right = right;
        }

        public int interpret(Map<String, Integer> context) {
            return left.interpret(context) + right.interpret(context);
        }
    }

    static class Multiply implements Expression {
        private final Expression left, right;

        Multiply(Expression left, Expression right) {
            this.left = left;
            this.right = right;
        }

        public int interpret(Map<String, Integer> context) {
            return left.interpret(context) * right.interpret(context);
        }
    }

    public static void main(String[] args) {
        // represents: (x + 3) * y
        Expression expression = new Multiply(
            new Add(new Variable("x"), new Number(3)),
            new Variable("y")
        );

        Map<String, Integer> context = Map.of("x", 2, "y", 5);
        System.out.println(expression.interpret(context));

        Expression constant = new Add(new Number(10), new Number(20));
        System.out.println(constant.interpret(Map.of()));
    }
}
