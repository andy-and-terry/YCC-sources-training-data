data class User(val name: String, val age: Int)

fun main() {
    val u = User("ann", 30)
    val (n, a) = u.copy(age = 31)
    println("$n $a")
}
