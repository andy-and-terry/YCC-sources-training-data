class Svc {
    val heavy: String by lazy { println("computing"); "value" }
}

fun main() {
    val s = Svc()
    println(s.heavy)
    println(s.heavy)
}
