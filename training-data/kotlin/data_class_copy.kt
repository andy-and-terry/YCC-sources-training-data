data class User(val name: String, val age: Int)

fun main() {
    val u = User("Ann", 30)
    val (n, a) = u
    println(u.copy(age = 31))
    println("$n $a")
}
