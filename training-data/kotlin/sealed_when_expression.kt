sealed class Result
data class Ok(val v: Int) : Result()
data class Err(val msg: String) : Result()

fun show(r: Result) = when (r) {
    is Ok -> "ok ${r.v}"
    is Err -> "err ${r.msg}"
}

fun main() = println(show(Ok(3)))
