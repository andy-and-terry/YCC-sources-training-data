sealed interface Expr
data class Num(val v: Double) : Expr
data class Add(val l: Expr, val r: Expr) : Expr
data class Mul(val l: Expr, val r: Expr) : Expr
object Zero : Expr

fun eval(e: Expr): Double = when (e) {
    is Num -> e.v
    is Add -> eval(e.l) + eval(e.r)
    is Mul -> eval(e.l) * eval(e.r)
    Zero -> 0.0
}

fun main() {
    println(eval(Add(Num(2.0), Mul(Num(3.0), Num(4.0)))))
}
