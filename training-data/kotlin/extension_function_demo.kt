fun String.isPalindrome() = this == reversed()
val Int.squared get() = this * this

fun main() {
    println("level".isPalindrome())
    println(7.squared)
}
