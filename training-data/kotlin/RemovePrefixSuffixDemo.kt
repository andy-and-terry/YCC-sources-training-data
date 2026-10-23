fun main() {
    val file = "report_2024.txt"
    println(file.removePrefix("report_"))
    println(file.removeSuffix(".txt"))
    println(file.removeSurrounding("_", "t"))
    println(file.removePrefix("missing_"))
    println("[tag]".removeSurrounding("[", "]"))
}
