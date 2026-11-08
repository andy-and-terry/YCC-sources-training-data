sealed class Result<out T> {
    data class Ok<T>(val value: T) : Result<T>()
    data class Err(val msg: String) : Result<Nothing>()
}

fun parse(s: String): Result<Int> =
    s.toIntOrNull()?.let { Result.Ok(it) } ?: Result.Err("bad: $s")

fun main() {
    for (s in listOf("12", "x")) {
        when (val r = parse(s)) {
            is Result.Ok -> println("ok ${r.value}")
            is Result.Err -> println("err ${r.msg}")
        }
    }
}
