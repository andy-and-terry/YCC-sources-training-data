data class Employee(val name: String, val dept: String, val salary: Int)

fun main() {
    val staff = listOf(
        Employee("Ann", "Eng", 120),
        Employee("Bob", "Ops", 80),
        Employee("Cy", "Eng", 100),
        Employee("Di", "Ops", 95),
        Employee("Ed", "HR", 70)
    )

    println(staff.groupBy { it.dept }.mapValues { (_, v) -> v.map { it.name } })
    println(staff.groupingBy { it.dept }.eachCount())
    println(staff.associate { it.name to it.salary })
    println(staff.associateBy { it.name.first() }.keys)

    val (high, low) = staff.partition { it.salary >= 100 }
    println("${high.size} high, ${low.size} low")

    println(staff.sumOf { it.salary })
    println(staff.maxByOrNull { it.salary }?.name)
    println(staff.map { it.salary }.average())

    val nums = (1..10).toList()
    println(nums.chunked(4))
    println(nums.windowed(3, step = 3))
    println(nums.zipWithNext { a, b -> b - a }.distinct())
    println(nums.fold(0) { acc, n -> acc + n * n })
    println(nums.runningReduce { a, b -> a + b })
    println(nums.take(3) + nums.takeLast(2))
    println(listOf(listOf(1, 2), listOf(3)).flatten())
    println(staff.flatMap { listOf(it.name, it.dept) }.toSet().size)
}
