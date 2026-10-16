fun main() {
    val names = listOf("ann", "bob", "cy")
    val ages = listOf(31, 25, 47)

    val pairs = names.zip(ages)
    println(pairs)
    println(names.zip(ages) { n, a -> "$n:$a" })

    val (ns, as_) = pairs.unzip()
    println(ns)
    println(as_)

    println(names.zipWithNext())
    println(pairs.toMap())
    println(listOf(1, 2, 3).zip(listOf("a", "b")))
}
