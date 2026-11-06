// Bulls and Cows scoring for equal-length digit strings.
data class Score(val bulls: Int, val cows: Int)

fun score(secret: String, guess: String): Score {
    val pairs = secret.zip(guess)
    val bulls = pairs.count { (s, g) -> s == g }
    val sc = pairs.filter { (s, g) -> s != g }.groupingBy { it.first }.eachCount()
    val gc = pairs.filter { (s, g) -> s != g }.groupingBy { it.second }.eachCount()
    val cows = sc.entries.sumOf { (c, n) -> minOf(n, gc[c] ?: 0) }
    return Score(bulls, cows)
}

fun main() {
    val (b, c) = score("1807", "7810")
    println("$b bull(s), $c cow(s)")
}
