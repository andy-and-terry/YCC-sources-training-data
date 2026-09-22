abstract class DataExporter {
    fun export(data: List<Int>): String {
        val prepared = prepare(data)
        val body = format(prepared)
        return wrap(body)
    }

    open fun prepare(data: List<Int>): List<Int> = data.sorted()
    abstract fun format(data: List<Int>): String
    open fun wrap(body: String): String = body
}

class CsvExporter : DataExporter() {
    override fun format(data: List<Int>): String = data.joinToString(",")
}

class JsonExporter : DataExporter() {
    override fun format(data: List<Int>): String = data.joinToString(",", "[", "]")
    override fun wrap(body: String): String = "{\"values\": $body}"
}

fun main() {
    val data = listOf(5, 3, 1, 4, 2)
    println(CsvExporter().export(data))
    println(JsonExporter().export(data))
}
