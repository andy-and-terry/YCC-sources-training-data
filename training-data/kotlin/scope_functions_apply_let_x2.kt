data class Req(var url: String = "", var retries: Int = 0)

fun main() {
    val r = Req().apply { url = "http://x"; retries = 3 }
    r.url.let { println(it.length) }
    println(r)
}
