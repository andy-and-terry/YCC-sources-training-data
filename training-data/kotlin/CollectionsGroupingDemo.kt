data class Employee(val name: String, val dept: String, val salary: Int)

fun main() {
    val staff = listOf(
        Employee("Ann", "eng", 120),
        Employee("Bob", "ops", 80),
        Employee("Cid", "eng", 100),
        Employee("Dee", "ops", 90),
        Employee("Eve", "hr", 70),
    )

    println(staff.groupBy { it.dept }.mapValues { (_, v) -> v.map { it.name } })
    println(staff.groupingBy { it.dept }.eachCount())

    val (rich, modest) = staff.partition { it.salary >= 100 }
    println("${rich.map { it.name }} ${modest.map { it.name }}")

    println(staff.associateBy { it.name }["Cid"]?.salary)
    println(staff.associate { it.name to it.salary })
    println(staff.sumOf { it.salary })
    println(staff.maxByOrNull { it.salary }?.name)
    println(staff.sortedWith(compareBy<Employee> { it.dept }.thenByDescending { it.salary }).map { it.name })

    val nums = (1..7).toList()
    println(nums.chunked(3))
    println(nums.windowed(3, step = 2))
    println(nums.zipWithNext { a, b -> b - a })
    println(nums.fold(0) { acc, n -> acc + n })
    println(nums.runningFold(0) { acc, n -> acc + n })
}
