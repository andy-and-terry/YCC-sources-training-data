abstract class Report(val title: String) {
    fun render(): String = buildString {
        appendLine(header())
        appendLine(body())
        append(footer())
    }

    protected open fun header() = "== $title =="
    protected abstract fun body(): String
    protected open fun footer() = "-- end --"
}

class SalesReport(private val totals: List<Int>) : Report("Sales") {
    override fun body() = "total=${totals.sum()} max=${totals.max()}"
}

class NoteReport(private val note: String) : Report("Note") {
    override fun header() = ">> $title"
    override fun body() = note
    override fun footer() = ""
}

fun main() {
    println(SalesReport(listOf(5, 9, 2)).render())
    println(NoteReport("remember the milk").render())
}
