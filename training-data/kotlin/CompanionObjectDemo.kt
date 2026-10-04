class User private constructor(val id: Int, val name: String) {
    companion object Factory {
        private var nextId = 1
        const val MAX_NAME_LENGTH = 20

        fun create(name: String): User {
            require(name.length <= MAX_NAME_LENGTH) { "name too long" }
            return User(nextId++, name)
        }

        @JvmStatic
        fun guest(): User = create("guest")
    }

    override fun toString() = "User(id=$id, name=$name)"
}

interface Parser<T> {
    fun parse(s: String): T
}

class Version(val major: Int, val minor: Int) {
    companion object : Parser<Version> {
        override fun parse(s: String): Version {
            val (a, b) = s.split(".").map { it.toInt() }
            return Version(a, b)
        }
    }

    override fun toString() = "v$major.$minor"
}

fun <T> parseAll(parser: Parser<T>, inputs: List<String>) = inputs.map(parser::parse)

fun main() {
    println(User.create("ann"))
    println(User.Factory.create("bob"))
    println(User.guest())
    println(User.MAX_NAME_LENGTH)
    println(Version.parse("2.7"))
    println(parseAll(Version, listOf("1.0", "3.14")))
    try {
        User.create("x".repeat(30))
    } catch (e: IllegalArgumentException) {
        println("error: ${e.message}")
    }
}
