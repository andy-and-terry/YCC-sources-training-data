sealed class Expr {
    data class Num(val v: Int) : Expr()
    data class Add(val l: Expr, val r: Expr) : Expr()
    data class Mul(val l: Expr, val r: Expr) : Expr()
}

fun eval(e: Expr): Int = when (e) {
    is Expr.Num -> e.v
    is Expr.Add -> eval(e.l) + eval(e.r)
    is Expr.Mul -> eval(e.l) * eval(e.r)
}

fun main() {
    println(eval(Expr.Add(Expr.Num(2), Expr.Mul(Expr.Num(3), Expr.Num(4)))))
}
