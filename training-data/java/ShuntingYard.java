import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;
import java.util.Map;

public class ShuntingYard {
    private static final Map<String, Integer> PREC = Map.of("+", 1, "-", 1, "*", 2, "/", 2, "^", 3);

    public static List<String> toRpn(String[] tokens) {
        List<String> out = new ArrayList<>();
        Deque<String> ops = new ArrayDeque<>();
        for (String t : tokens) {
            if (PREC.containsKey(t)) {
                while (!ops.isEmpty() && PREC.containsKey(ops.peek())
                        && (PREC.get(ops.peek()) > PREC.get(t) || (PREC.get(ops.peek()).equals(PREC.get(t)) && !t.equals("^")))) {
                    out.add(ops.pop());
                }
                ops.push(t);
            } else if (t.equals("(")) {
                ops.push(t);
            } else if (t.equals(")")) {
                while (!ops.peek().equals("(")) out.add(ops.pop());
                ops.pop();
            } else {
                out.add(t);
            }
        }
        while (!ops.isEmpty()) out.add(ops.pop());
        return out;
    }

    public static double evalRpn(List<String> rpn) {
        Deque<Double> st = new ArrayDeque<>();
        for (String t : rpn) {
            if (!PREC.containsKey(t)) {
                st.push(Double.parseDouble(t));
                continue;
            }
            double b = st.pop(), a = st.pop();
            st.push(switch (t) {
                case "+" -> a + b;
                case "-" -> a - b;
                case "*" -> a * b;
                case "/" -> a / b;
                default -> Math.pow(a, b);
            });
        }
        return st.pop();
    }

    public static void main(String[] args) {
        List<String> rpn = toRpn("3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3".split(" "));
        System.out.println(String.join(" ", rpn) + " = " + evalRpn(rpn));
    }
}
