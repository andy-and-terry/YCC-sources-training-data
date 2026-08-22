public class VisitorPattern {
    interface Visitor {
        int visitNumber(Num node);
        int visitAdd(Add node);
    }

    interface Expr {
        int accept(Visitor visitor);
    }

    static class Num implements Expr {
        int value;

        Num(int value) {
            this.value = value;
        }

        public int accept(Visitor visitor) {
            return visitor.visitNumber(this);
        }
    }

    static class Add implements Expr {
        Expr left, right;

        Add(Expr left, Expr right) {
            this.left = left;
            this.right = right;
        }

        public int accept(Visitor visitor) {
            return visitor.visitAdd(this);
        }
    }

    static class EvalVisitor implements Visitor {
        public int visitNumber(Num node) {
            return node.value;
        }

        public int visitAdd(Add node) {
            return node.left.accept(this) + node.right.accept(this);
        }
    }

    public static void main(String[] args) {
        Expr expr = new Add(new Num(1), new Add(new Num(2), new Num(3)));
        System.out.println(expr.accept(new EvalVisitor()));
    }
}
