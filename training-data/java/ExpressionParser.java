import java.util.Map;

/** Recursive-descent parser producing an AST of sealed records, with variables. */
public class ExpressionParser {
    sealed interface Expr permits Num, Var, Neg, Bin {}
    record Num(double v) implements Expr {}
    record Var(String name) implements Expr {}
    record Neg(Expr e) implements Expr {}
    record Bin(char op, Expr l, Expr r) implements Expr {}

    private final String s;
    private int pos;

    private ExpressionParser(String s) { this.s = s.replace(" ", ""); }

    public static Expr parse(String s) {
        ExpressionParser p = new ExpressionParser(s);
        Expr e = p.expr();
        if (p.pos != p.s.length()) throw new IllegalArgumentException("trailing input at " + p.pos);
        return e;
    }

    private char peek() { return pos < s.length() ? s.charAt(pos) : '\0'; }

    private Expr expr() {
        Expr e = term();
        while (peek() == '+' || peek() == '-') e = new Bin(s.charAt(pos++), e, term());
        return e;
    }

    private Expr term() {
        Expr e = power();
        while (peek() == '*' || peek() == '/') e = new Bin(s.charAt(pos++), e, power());
        return e;
    }

    private Expr power() {
        Expr base = unary();
        if (peek() == '^') {
            pos++;
            return new Bin('^', base, power());
        }
        return base;
    }

    private Expr unary() {
        if (peek() == '-') {
            pos++;
            return new Neg(unary());
        }
        return primary();
    }

    private Expr primary() {
        if (peek() == '(') {
            pos++;
            Expr e = expr();
            if (peek() != ')') throw new IllegalArgumentException("expected ) at " + pos);
            pos++;
            return e;
        }
        int start = pos;
        if (Character.isLetter(peek())) {
            while (Character.isLetterOrDigit(peek())) pos++;
            return new Var(s.substring(start, pos));
        }
        while (Character.isDigit(peek()) || peek() == '.') pos++;
        if (start == pos) throw new IllegalArgumentException("unexpected '" + peek() + "' at " + pos);
        return new Num(Double.parseDouble(s.substring(start, pos)));
    }

    public static double eval(Expr e, Map<String, Double> env) {
        return switch (e) {
            case Num n -> n.v();
            case Var v -> env.get(v.name());
            case Neg n -> -eval(n.e(), env);
            case Bin b -> {
                double l = eval(b.l(), env), r = eval(b.r(), env);
                yield switch (b.op()) {
                    case '+' -> l + r;
                    case '-' -> l - r;
                    case '*' -> l * r;
                    case '/' -> l / r;
                    default -> Math.pow(l, r);
                };
            }
        };
    }

    public static void main(String[] args) {
        Map<String, Double> env = Map.of("x", 2.0, "y", 4.0);
        for (String src : new String[] {"1 + 2 * 3", "2 ^ 3 ^ 2", "-(x + 3) * y", "(1 + 2) / 4"}) {
            Expr e = parse(src);
            System.out.println(src + " = " + eval(e, env) + "   " + e);
        }
    }
}
