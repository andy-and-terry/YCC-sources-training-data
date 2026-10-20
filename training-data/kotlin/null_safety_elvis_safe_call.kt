class Address(val city: String?)
class Person(val address: Address?)

fun cityLen(p: Person?): Int = p?.address?.city?.length ?: 0

fun main() {
    println(cityLen(Person(Address("Oslo"))))
    println(cityLen(Person(null)))
    println(cityLen(null))
    val s: String? = "text"
    val t = s!!.length
    val u = (null as String?).orEmpty()
    println("$t [$u]")
    val list: List<Int?> = listOf(1, null, 3)
    println(list.filterNotNull().sum())
    println(requireNotNull(s) { "must not be null" })
}
