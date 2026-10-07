class User private constructor(val name: String, val admin: Boolean) {
    companion object {
        private var created = 0

        fun regular(name: String) = User(name, false).also { created++ }
        fun admin(name: String) = User(name, true).also { created++ }
        fun count() = created
        const val MAX_NAME = 20
    }

    override fun toString() = "User($name, admin=$admin)"
}

interface Shape { fun area(): Double }

class Circle(val r: Double) : Shape {
    override fun area() = Math.PI * r * r

    companion object : Comparator<Circle> {
        override fun compare(a: Circle, b: Circle) = a.r.compareTo(b.r)
    }
}

fun main() {
    println(User.regular("ann"))
    println(User.admin("root"))
    println(User.count())
    println(listOf(Circle(3.0), Circle(1.0)).sortedWith(Circle).map { it.r })
}
