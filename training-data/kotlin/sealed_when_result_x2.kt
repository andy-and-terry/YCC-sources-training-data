sealed class Result {
    data class Ok(val v: Int) : Result()
    data class Err(val msg: String) : Result()
}

fun show(r: Result) = when (r) {
    is Result.Ok -> "ok ${r.v}"
    is Result.Err -> "err ${r.msg}"
}

fun main() = println(show(Result.Ok(3)))
