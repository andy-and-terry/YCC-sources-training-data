data class Person(val id: Int, val name: String, val city: String)

fun main() {
    val people = listOf(
        Person(1, "Ann", "Oslo"),
        Person(2, "Bob", "Rome"),
        Person(3, "Cy", "Oslo"),
    )

    println(people.associateBy { it.id }.keys)
    println(people.associate { it.name to it.city })
    println(people.associateWith { it.name.length }.values)
    println(people.groupBy({ it.city }, { it.name }))
    println(people.groupingBy { it.city }.eachCount())
    println(people.partition { it.city == "Oslo" }.second.map { it.name })
}
