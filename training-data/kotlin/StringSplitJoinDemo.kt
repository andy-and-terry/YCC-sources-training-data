fun main() {
    val csv = "a,b,,c"
    println(csv.split(","))
    println(csv.split(",").filter { it.isNotEmpty() })
    println("one  two   three".split(Regex("\\s+")))
    println("k=v=w".split("=", limit = 2))

    val words = listOf("alpha", "beta", "gamma")
    println(words.joinToString())
    println(words.joinToString(separator = " | ", prefix = "[", postfix = "]"))
    println(words.joinToString(limit = 2, truncated = "..."))
    println(words.joinToString { it.uppercase() })

    println("path/to/file.txt".substringAfterLast('/'))
    println("path/to/file.txt".substringBeforeLast('.'))
    println("key: value".substringAfter(": "))
}
