class Mail { var to = ""; var body = "" }

fun main() {
    val m = Mail().apply { to = "a@x.io"; body = "hi" }
    println(m.run { "$to: $body" })
    "text".also { println(it.length) }.let { println(it.uppercase()) }
}
