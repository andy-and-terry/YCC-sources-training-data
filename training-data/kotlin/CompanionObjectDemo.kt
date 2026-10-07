class User private constructor(val id: Int, val name: String) {
    companion object Factory {
        private var nextId = 1
        const val DEFAULT_NAME = "guest"

        fun create(name: String = DEFAULT_NAME): User = User(nextId++, name)

        @JvmStatic
        fun parse(text: String): User = create(text.trim().replaceFirstChar { it.uppercase() })
    }

    override fun toString() = "User(id=$id, name=$name)"
}

interface Shape { fun area(): Double }

class Circle(private val r: Double) : Shape {
    override fun area() = Math.PI * r * r

    companion object : () -> Circle {
        override fun invoke() = Circle(1.0)
    }
}

fun main() {
    println(User.create("ann"))
    println(User.create())
    println(User.parse("  bob "))
    println(User.DEFAULT_NAME)
    println(User.Factory.create("cy"))
    println("%.3f".format(Circle().area()))
}
