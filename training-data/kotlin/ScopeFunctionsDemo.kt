data class User(var name: String, var age: Int)

fun main() {
    val user = User("Alice", 30).also {
        println("created: $it")
    }

    val description = user.let {
        "${it.name} is ${it.age} years old"
    }
    println(description)

    user.apply {
        age += 1
    }
    println(user)

    val isAdult = with(user) {
        age >= 18
    }
    println(isAdult)

    val result = run {
        val bonus = 5
        user.age + bonus
    }
    println(result)
}
