fun main() {
    val rows = listOf(Triple("Widget", 4, 3.5), Triple("Gadget", 12, 10.0), Triple("Gizmo", 1, 100.25))

    println("Item".padEnd(10) + "Qty".padStart(5) + "Price".padStart(10))
    for ((name, qty, price) in rows) {
        println(name.padEnd(10) + qty.toString().padStart(5) + "%.2f".format(price).padStart(10))
    }

    println("7".padStart(3, '0'))
    println("%05d|%-6s|%6.1f|%x".format(42, "ab", 3.14159, 255))
    println("abc".repeat(3))
    println("  trim me  ".trim() + "|")
    println("Hello".takeLast(3) + " " + "Hello".drop(2) + " " + "Hello".take(2))
}
