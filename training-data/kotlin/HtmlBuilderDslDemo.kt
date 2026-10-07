class Tag(val name: String) {
    private val children = mutableListOf<Tag>()
    private val attributes = mutableMapOf<String, String>()
    private var text: String = ""

    fun attr(key: String, value: String) {
        attributes[key] = value
    }

    fun text(value: String) {
        text = value
    }

    fun tag(name: String, block: Tag.() -> Unit): Tag {
        val child = Tag(name).apply(block)
        children.add(child)
        return child
    }

    override fun toString(): String {
        val attrsString = attributes.entries.joinToString(" ") { (k, v) -> "$k=\"$v\"" }
        val openTag = if (attrsString.isEmpty()) "<$name>" else "<$name $attrsString>"
        val body = text + children.joinToString("") { it.toString() }
        return "$openTag$body</$name>"
    }
}

fun html(block: Tag.() -> Unit): Tag = Tag("html").apply(block)

fun main() {
    val page = html {
        tag("body") {
            attr("class", "main")
            tag("h1") { text("Welcome") }
            tag("p") { text("Hello, DSL!") }
        }
    }
    println(page)
}
