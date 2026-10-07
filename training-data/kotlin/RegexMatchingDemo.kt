fun main() {
    val log = """
        2024-03-01 ERROR db: connection lost
        2024-03-01 INFO api: started
        2024-03-02 ERROR api: timeout
    """.trimIndent()

    val pattern = Regex("""(\d{4})-(\d{2})-(\d{2}) (\w+) (\w+): (.+)""")

    for (line in log.lines()) {
        val match = pattern.matchEntire(line) ?: continue
        val (year, month, day, level, module, msg) = match.destructured
        if (level == "ERROR") println("$module failed on $day/$month/$year: $msg")
    }

    val named = Regex("(?<key>\\w+)=(?<value>\\d+)")
    named.findAll("a=1, b=22, c=333").forEach {
        println(it.groups["key"]?.value + " -> " + it.groups["value"]?.value)
    }

    println(Regex("\\d+").replace("a1b22c333") { "<${it.value.length}>" })
    println("2024-03-01".replace(Regex("(\\d+)-(\\d+)-(\\d+)"), "$3.$2.$1"))
    println("one  two   three".split(Regex("\\s+")))
    println("hello" matches Regex("h.*o"))
    println(Regex("[aeiou]", RegexOption.IGNORE_CASE).findAll("Kotlin Is Fun").count())
    println("abc123".contains(Regex("\\d")))
    println(Regex("^[\\w.]+@[\\w.]+\\.[a-z]{2,}$").matches("me@example.com"))
}
