data class User(val name: String, val age: Int, val tags: List<String> = emptyList())

fun main() {
    val u = User("Ada", 36)
    val older = u.copy(age = 37, tags = listOf("math"))
    val (name, age) = older
    println("$u $older $name $age ${u == older} ${u.hashCode() == User("Ada", 36).hashCode()}")
}
