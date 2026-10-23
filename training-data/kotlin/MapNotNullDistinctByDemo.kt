data class User(val name: String, val city: String, val age: Int?)

fun main() {
    val users = listOf(
        User("Ann", "Paris", 31),
        User("Bob", "Rome", null),
        User("Cid", "Paris", 25),
        User("Dee", "Oslo", null),
    )

    println(users.mapNotNull { it.age })
    println(users.distinctBy { it.city }.map { it.name })
    println(users.firstNotNullOf { it.age })
    println(users.firstNotNullOfOrNull { u -> u.age?.takeIf { it > 40 } })

    println(listOf("1", "x", "3").mapNotNull { it.toIntOrNull() })
    println(listOf(1, 2, 3, 4, 5, 6).distinctBy { it % 3 })
    println(users.filterNot { it.age == null }.sumOf { it.age ?: 0 })
}
