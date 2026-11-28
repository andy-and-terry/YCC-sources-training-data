fun main() {
    val s = "abcabc"; val k = 3; val b = 31L; val m = 1000003L
    var pw = 1L
    repeat(k - 1) { pw = pw * b % m }
    var h = s.take(k).fold(0L) { acc, c -> (acc * b + c.code) % m }
    println("0 $h")
    for (i in 1..s.length - k) {
        h = (h - s[i - 1].code * pw % m + m) % m
        h = (h * b + s[i + k - 1].code) % m
        println("$i $h")
    }
}
