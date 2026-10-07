// A legacy API with an incompatible interface, adapted to the shape the
// rest of the application expects.
class LegacyXmlReader {
    fun fetchXmlPayload(): String = "<point><x>3</x><y>4</y></point>"
}

interface JsonSource {
    fun fetchJson(): String
}

class XmlToJsonAdapter(private val legacy: LegacyXmlReader) : JsonSource {
    override fun fetchJson(): String {
        val xml = legacy.fetchXmlPayload()
        val x = Regex("<x>(.*?)</x>").find(xml)?.groupValues?.get(1) ?: "0"
        val y = Regex("<y>(.*?)</y>").find(xml)?.groupValues?.get(1) ?: "0"
        return """{"x":$x,"y":$y}"""
    }
}

fun printJson(source: JsonSource) {
    println(source.fetchJson())
}

fun main() {
    val adapter = XmlToJsonAdapter(LegacyXmlReader())
    printJson(adapter)
}
