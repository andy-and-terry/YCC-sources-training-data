fun isRotation(a: String, b: String): Boolean = a.length == b.length && b in a + a

fun main() {
    println(isRotation("waterbottle", "erbottlewat"))
    println(isRotation("abc", "acb"))
}
