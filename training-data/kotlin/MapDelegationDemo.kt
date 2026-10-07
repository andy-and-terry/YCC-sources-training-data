class UserProfile(map: Map<String, Any?>) {
    val name: String by map
    val age: Int by map
}

fun main() {
    val data = mapOf(
        "name" to "Grace",
        "age" to 34,
    )
    val profile = UserProfile(data)
    println("${profile.name} is ${profile.age} years old")
}
