data class Employee(val name: String, val dept: String, val salary: Int)

fun main() {
    val staff = listOf(
        Employee("Ann", "Eng", 120),
        Employee("Bob", "Eng", 100),
        Employee("Cid", "Ops", 80),
        Employee("Dee", "Ops", 95),
        Employee("Eve", "HR", 70),
    )

    println(staff.groupBy { it.dept }.mapValues { (_, es) -> es.sumOf { it.salary } })
    println(staff.associateBy({ it.name }, { it.salary }))
    println(staff.partition { it.salary >= 95 }.let { (hi, lo) -> hi.size to lo.size })
    println(staff.maxByOrNull { it.salary }?.name)
    println(staff.sortedWith(compareBy({ it.dept }, { -it.salary })).map { it.name })
    println(staff.map { it.name }.chunked(2))
    println(staff.map { it.salary }.windowed(3) { it.average() })
    println(staff.map { it.dept }.distinct().zip(listOf(1, 2, 3)))
    println(staff.fold(0) { acc, e -> acc + e.salary })
}
