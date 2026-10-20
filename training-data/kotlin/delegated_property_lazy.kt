class Report {
    val body: String by lazy {
        println("computing")
        "expensive result"
    }
    var title: String by kotlin.properties.Delegates.observable("draft") { _, old, new ->
        println("title: $old -> $new")
    }
}

fun main() {
    val r = Report()
    r.title = "Q3"
    println(r.body)
    println(r.body)
}
