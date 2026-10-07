fun isPangram(s: String): Boolean = s.lowercase().filter { it in 'a'..'z' }.toSet().size == 26

fun main() {
    println(isPangram("The quick brown fox jumps over the lazy dog"))
    println(isPangram("Hello world"))
}
