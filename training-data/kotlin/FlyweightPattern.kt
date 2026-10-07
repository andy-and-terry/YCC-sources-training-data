data class TreeType(val name: String, val color: String, val texture: String)

class TreeFactory {
    private val cache = mutableMapOf<String, TreeType>()

    fun get(name: String, color: String, texture: String): TreeType {
        val key = "${name}_${color}_$texture"
        return cache.getOrPut(key) {
            println("created new shared TreeType for $key")
            TreeType(name, color, texture)
        }
    }

    fun uniqueCount() = cache.size
}

fun main() {
    val factory = TreeFactory()
    val positions = listOf(0 to 0, 5 to 5, 10 to 10)
    for ((x, y) in positions) {
        val t = factory.get("oak", "green", "bark_01")
        println("tree ${t.name} at ($x, $y)")
    }
    println("unique flyweight objects: ${factory.uniqueCount()}")
}
