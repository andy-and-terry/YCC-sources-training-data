import kotlin.properties.Delegates
import kotlin.reflect.KProperty

class Trimmed {
    private var value = ""
    operator fun getValue(thisRef: Any?, property: KProperty<*>): String = value
    operator fun setValue(thisRef: Any?, property: KProperty<*>, v: String) {
        value = v.trim()
    }
}

class Settings(map: Map<String, Any?>) {
    val theme: String by map
    val fontSize: Int by map
    var nickname: String by Trimmed()
    var volume: Int by Delegates.vetoable(50) { _, _, new -> new in 0..100 }
    val expensive: String by lazy { println("computing..."); "ready" }
}

fun main() {
    val s = Settings(mapOf("theme" to "dark", "fontSize" to 14))
    s.nickname = "   ada  "
    s.volume = 150
    println("${s.theme} ${s.fontSize} [${s.nickname}] ${s.volume}")
    println(s.expensive)
    println(s.expensive)
}
