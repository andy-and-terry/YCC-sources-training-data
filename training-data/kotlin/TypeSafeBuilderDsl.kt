// Kotlin DSL idiom: a lambda-with-receiver builder gives type-safe,
// nested syntax without any external templating.
class Html {
    private val children = mutableListOf<String>()

    fun body(init: Body.() -> Unit) {
        val body = Body()
        body.init()
        children.add(body.render())
    }

    fun render(): String = children.joinToString("\n")
}

class Body {
    private val lines = mutableListOf<String>()

    fun p(text: String) {
        lines.add("  <p>$text</p>")
    }

    fun ul(init: Ul.() -> Unit) {
        val ul = Ul()
        ul.init()
        lines.add(ul.render())
    }

    fun render(): String = "<body>\n${lines.joinToString("\n")}\n</body>"
}

class Ul {
    private val items = mutableListOf<String>()

    fun li(text: String) {
        items.add("    <li>$text</li>")
    }

    fun render(): String = "  <ul>\n${items.joinToString("\n")}\n  </ul>"
}

fun html(init: Html.() -> Unit): Html {
    val html = Html()
    html.init()
    return html
}

fun main() {
    val page = html {
        body {
            p("Welcome")
            ul {
                li("first")
                li("second")
            }
        }
    }
    println(page.render())
}
