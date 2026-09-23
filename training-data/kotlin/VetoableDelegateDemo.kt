import kotlin.properties.Delegates

class Thermostat {
    var temperature: Int by Delegates.vetoable(20) { _, old, new ->
        if (new in -10..40) {
            true
        } else {
            println("rejected: $new is out of range, keeping $old")
            false
        }
    }
}

fun main() {
    val thermostat = Thermostat()
    println(thermostat.temperature)
    thermostat.temperature = 25
    println(thermostat.temperature)
    thermostat.temperature = 100
    println(thermostat.temperature)
}
