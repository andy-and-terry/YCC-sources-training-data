data class Person(val name: String, val age: Int, val city: String)

fun main() {
    val people = listOf(
        Person("Zoe", 30, "Oslo"),
        Person("Adam", 25, "Rome"),
        Person("Mia", 30, "Rome"),
        Person("Bob", 25, "Oslo")
    )

    println(people.sortedBy { it.age }.map { it.name })
    println(people.sortedByDescending { it.name }.map { it.name })
    println(people.sortedWith(compareBy<Person> { it.age }.thenBy { it.name }).map { it.name })
    println(people.sortedWith(compareByDescending<Person> { it.age }.thenBy { it.city }.thenBy { it.name }).map { it.name })

    val byLength = Comparator<String> { a, b -> a.length - b.length }
    println(listOf("ccc", "a", "bb").sortedWith(byLength.reversed()))
    println(listOf("b", null, "a").sortedWith(nullsLast(naturalOrder())))
    println(listOf("Banana", "apple", "cherry").sortedWith(String.CASE_INSENSITIVE_ORDER))
    println(listOf(3, 1, 2).sortedWith(reverseOrder()))

    val mutable = mutableListOf(5, 3, 8)
    mutable.sort()
    mutable.reverse()
    println(mutable)
    println(people.minByOrNull { it.age }?.name)
    println(people.maxOf { it.name.length })
    println(people.groupBy { it.city }.toSortedMap().mapValues { it.value.size })
    println(mapOf("b" to 2, "a" to 3, "c" to 1).entries.sortedBy { it.value }.map { it.key })
    println(people.sortedWith(compareBy({ it.city }, { -it.age })).map { it.name })
}
