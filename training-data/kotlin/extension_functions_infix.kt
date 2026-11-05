fun String.isPalindrome() = this == reversed()
infix fun Int.pow(n: Int): Long = generateSequence(1L) { it * this }.drop(n).first()

fun main() {
    println("level".isPalindrome())
    println(2 pow 10)
}
