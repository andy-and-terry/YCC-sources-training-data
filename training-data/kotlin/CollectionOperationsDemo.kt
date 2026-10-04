data class Employee(val name: String, val dept: String, val salary: Int)

fun main() {
    val staff = listOf(
        Employee("Ann", "eng", 120), Employee("Bob", "eng", 100),
        Employee("Cid", "ops", 90), Employee("Dee", "ops", 95),
    )
    println(staff.groupBy { it.dept }.mapValues { (_, v) -> v.sumOf { it.salary } })
    println(staff.partition { it.salary >= 100 }.first.map { it.name })
    println(staff.associateBy { it.name }["Cid"])
    println(staff.maxByOrNull { it.salary }?.name)
    println(staff.sortedWith(compareBy({ it.dept }, { -it.salary })).map { it.name })
    println(staff.map { it.salary }.windowed(2).map { (a, b) -> b - a })
    println(staff.chunked(3).map { it.size })
    println(staff.fold(0) { acc, e -> acc + e.salary } / staff.size)
    println(staff.zipWithNext { a, b -> a.name + b.name })
}
