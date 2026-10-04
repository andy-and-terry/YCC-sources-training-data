class User private constructor(val name: String, val id: Int) {
    companion object Factory {
        private var nextId = 1
        const val MAX_NAME = 10

        fun create(name: String): User {
            require(name.length <= MAX_NAME) { "name too long" }
            return User(name, nextId++)
        }

        @JvmStatic
        fun guest(): User = create("guest")
    }

    override fun toString() = "User($name, #$id)"
}

interface Parser<T> {
    fun parse(s: String): T
}

class Point(val x: Int, val y: Int) {
    companion object : Parser<Point> {
        override fun parse(s: String): Point {
            val (a, b) = s.split(",").map { it.trim().toInt() }
            return Point(a, b)
        }
    }

    override fun toString() = "($x, $y)"
}

fun <T> readAll(parser: Parser<T>, vararg inputs: String): List<T> = inputs.map(parser::parse)

fun main() {
    println(User.create("ann"))
    println(User.guest())
    println(User.Factory.create("bob"))
    println(User.MAX_NAME)

    println(Point.parse("3, 4"))
    println(readAll(Point, "1,2", "5,6"))

    try {
        User.create("a-very-long-name")
    } catch (e: IllegalArgumentException) {
        println(e.message)
    }
}
