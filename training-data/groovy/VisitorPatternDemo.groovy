interface Visitor {
    int visitNumber(NumberExpr n)
    int visitAdd(AddExpr a)
}

interface Expr {
    int accept(Visitor v)
}

class NumberExpr implements Expr {
    int value
    NumberExpr(int value) { this.value = value }
    int accept(Visitor v) { return v.visitNumber(this) }
}

class AddExpr implements Expr {
    Expr left
    Expr right
    AddExpr(Expr left, Expr right) { this.left = left; this.right = right }
    int accept(Visitor v) { return v.visitAdd(this) }
}

class EvalVisitor implements Visitor {
    int visitNumber(NumberExpr n) { return n.value }
    int visitAdd(AddExpr a) { return a.left.accept(this) + a.right.accept(this) }
}

def expr = new AddExpr(new NumberExpr(1), new AddExpr(new NumberExpr(2), new NumberExpr(3)))
println expr.accept(new EvalVisitor())
