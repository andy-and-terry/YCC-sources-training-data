interface Expr {
    fun <R> accept(visitor: ExprVisitor<R>): R
}

class NumberExpr(val value: Int) : Expr {
    override fun <R> accept(visitor: ExprVisitor<R>): R = visitor.visitNumber(this)
}

class AddExpr(val left: Expr, val right: Expr) : Expr {
    override fun <R> accept(visitor: ExprVisitor<R>): R = visitor.visitAdd(this)
}

interface ExprVisitor<R> {
    fun visitNumber(expr: NumberExpr): R
    fun visitAdd(expr: AddExpr): R
}

class EvalVisitor : ExprVisitor<Int> {
    override fun visitNumber(expr: NumberExpr): Int = expr.value
    override fun visitAdd(expr: AddExpr): Int = expr.left.accept(this) + expr.right.accept(this)
}

class PrintVisitor : ExprVisitor<String> {
    override fun visitNumber(expr: NumberExpr): String = expr.value.toString()
    override fun visitAdd(expr: AddExpr): String =
        "(${expr.left.accept(this)} + ${expr.right.accept(this)})"
}

fun main() {
    val expr: Expr = AddExpr(NumberExpr(1), AddExpr(NumberExpr(2), NumberExpr(3)))
    println(expr.accept(EvalVisitor()))
    println(expr.accept(PrintVisitor()))
}
