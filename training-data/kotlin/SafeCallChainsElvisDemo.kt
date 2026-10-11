data class Address(val city: String?)
data class User(val name: String, val address: Address?)

fun cityOf(user: User?): String = user?.address?.city?.uppercase() ?: "unknown"

fun main() {
    println(cityOf(User("Ann", Address("Oslo"))))
    println(cityOf(User("Bob", Address(null))))
    println(cityOf(User("Cy", null)))
    println(cityOf(null))

    val list: List<String?> = listOf("a", null, "c")
    println(list.filterNotNull())
    println(list.map { it ?: "-" })
    println(list.firstOrNull { it == null } == null)

    val len = list[1]?.length
    println(len)
    list[0]?.let { println("first is $it") }
    val s: String? = null
    println(s.orEmpty().length)
    println(s.isNullOrBlank())
}
