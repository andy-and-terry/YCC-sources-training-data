interface Named { val name: String; fun greet() = "I am $name" }
interface Aged { val age: Int }
abstract class Base(override val name: String) : Named {
    abstract fun role(): String
    override fun toString() = "${greet()} (${role()})"
}
class Dev(name: String, override val age: Int) : Base(name), Aged {
    override fun role() = "dev"
}

fun main() {
    val d = Dev("Ada", 36)
    println(d)
    println(d is Aged && d is Named)
    val list: List<Named> = listOf(d, object : Named { override val name = "anon" })
    println(list.map { it.greet() })
}
