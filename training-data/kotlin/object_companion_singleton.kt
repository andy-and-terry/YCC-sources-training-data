object Registry {
    private val items = mutableListOf<String>()
    fun add(s: String) = items.add(s)
    val size get() = items.size
}

class Shape private constructor(val sides: Int) {
    companion object {
        fun triangle() = Shape(3)
        fun square() = Shape(4)
        const val NAME = "shape"
    }
}

fun main() {
    Registry.add("a"); Registry.add("b")
    println("${Registry.size} ${Shape.triangle().sides} ${Shape.NAME}")
    val anon = object : Comparator<String> { override fun compare(a: String, b: String) = a.length - b.length }
    println(listOf("ccc", "a", "bb").sortedWith(anon))
}
