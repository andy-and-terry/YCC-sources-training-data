class ValidationError(msg: String, val field: String) : Exception(msg)

fun validate(age: Int) { if (age < 0) throw ValidationError("negative", "age") }

fun main() {
    val r = runCatching { validate(-1) }
    println(r.isFailure)
    println(r.exceptionOrNull()?.message)
    println(runCatching { "12x".toInt() }.getOrElse { -1 })
    println("5".toIntOrNull() ?: 0)
    try { validate(-5) } catch (e: ValidationError) { println("${e.field}: ${e.message}") } finally { println("done") }
    val res = java.io.StringReader("abc").use { it.read().toChar() }
    println(res)
    check(res == 'a') { "unexpected" }
}
