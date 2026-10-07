import kotlin.reflect.KProperty

class ClampedInt(private var value: Int, private val min: Int, private val max: Int) {
    operator fun getValue(thisRef: Any?, property: KProperty<*>): Int = value

    operator fun setValue(thisRef: Any?, property: KProperty<*>, newValue: Int) {
        value = newValue.coerceIn(min, max)
    }
}

class Volume {
    var level: Int by ClampedInt(50, 0, 100)
}

fun main() {
    val volume = Volume()
    println(volume.level)
    volume.level = 150
    println(volume.level)
    volume.level = -20
    println(volume.level)
}
