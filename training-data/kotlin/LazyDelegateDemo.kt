class ExpensiveResource {
    val data: String by lazy {
        println("computing expensive resource...")
        "resource-data"
    }
}

fun main() {
    val resource = ExpensiveResource()
    println("resource created, nothing computed yet")
    println(resource.data)
    println(resource.data)

    val fibonacci: List<Int> by lazy {
        println("building fibonacci sequence")
        val seq = mutableListOf(0, 1)
        while (seq.size < 10) {
            seq.add(seq[seq.size - 1] + seq[seq.size - 2])
        }
        seq
    }
    println(fibonacci)
}
