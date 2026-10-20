fun <A, B, C> ((A) -> B).andThen(g: (B) -> C): (A) -> C = { a -> g(this(a)) }
fun <T> repeatApply(n: Int, f: (T) -> T): (T) -> T = { x -> (1..n).fold(x) { acc, _ -> f(acc) } }
fun curry(f: (Int, Int) -> Int): (Int) -> (Int) -> Int = { a -> { b -> f(a, b) } }

fun main() {
    val inc = { x: Int -> x + 1 }
    val dbl = { x: Int -> x * 2 }
    println(inc.andThen(dbl)(5))
    println(repeatApply(5, dbl)(1))
    println(curry { a, b -> a - b }(10)(3))
    val fs: List<(Int) -> Int> = listOf(inc, dbl, { x: Int -> -x })
    println(fs.map { it(7) })
}
