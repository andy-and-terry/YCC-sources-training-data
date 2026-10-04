typealias Handler = (String) -> Unit
typealias Graph = Map<Int, List<Int>>

class Service {
    lateinit var name: String
    val isReady: Boolean get() = ::name.isInitialized

    fun init(n: String) { name = n }
}

fun dfs(g: Graph, start: Int, visit: Handler) {
    val seen = mutableSetOf<Int>()
    fun go(n: Int) {
        if (!seen.add(n)) return
        visit(n.toString())
        g[n].orEmpty().forEach(::go)
    }
    go(start)
}

fun main() {
    val s = Service()
    println(s.isReady)
    s.init("svc")
    println(s.isReady)
    println(s.name)
    dfs(mapOf(1 to listOf(2, 3), 2 to listOf(4), 3 to listOf(4)), 1) { print("$it ") }
    println()
}
