infix fun Int.pow(e: Int): Long = Math.pow(this.toDouble(), e.toDouble()).toLong()
infix fun <A, B> A.to2(b: B) = Pair(this, b)

class Html { private val sb = StringBuilder()
    fun tag(name: String, body: Html.() -> Unit) { sb.append("<$name>"); body(); sb.append("</$name>") }
    operator fun String.unaryPlus() { sb.append(this) }
    override fun toString() = sb.toString() }

fun html(f: Html.() -> Unit) = Html().apply(f)

fun main() {
    println(2 pow 10)
    println(1 to2 "a")
    println(html { tag("ul") { tag("li") { +"one" }; tag("li") { +"two" } } })
}
