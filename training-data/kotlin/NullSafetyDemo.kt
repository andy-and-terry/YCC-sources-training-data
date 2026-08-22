data class Address(val city: String)
data class Company(val address: Address?)
data class Employee(val company: Company?)

fun cityOf(employee: Employee): String {
    return employee.company?.address?.city ?: "unknown"
}

fun main() {
    val e1 = Employee(Company(Address("Berlin")))
    val e2 = Employee(Company(null))
    val e3 = Employee(null)
    println(cityOf(e1))
    println(cityOf(e2))
    println(cityOf(e3))
}
