fun httpStatusCategory(code: Int): String = when (code) {
    in 200..299 -> "success"
    in 300..399 -> "redirect"
    in 400..499 -> "client error"
    in 500..599 -> "server error"
    else -> "unknown"
}

fun main() {
    for (code in listOf(200, 301, 404, 503, 999)) {
        println("$code: ${httpStatusCategory(code)}")
    }
}
