data class User(val name: String, val age: Int, val tags: List<String>)

fun parseSimpleJson(input: String): Map<String, String> {
    return input.trim('{', '}').split(",")
        .map { it.split(":") }
        .associate { it[0].trim().trim('"') to it[1].trim() }
}

fun main() {
    val user = User("Ada", 30, listOf("math", "engineering"))
    println(user)
    val parsed = parseSimpleJson("""{"name": "Ada", "age": 30}""")
    println(parsed)
}
