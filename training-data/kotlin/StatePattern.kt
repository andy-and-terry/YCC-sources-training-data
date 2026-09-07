sealed class TrafficLightState {
    abstract fun next(): TrafficLightState

    object Red : TrafficLightState() {
        override fun next(): TrafficLightState = Green
    }

    object Green : TrafficLightState() {
        override fun next(): TrafficLightState = Yellow
    }

    object Yellow : TrafficLightState() {
        override fun next(): TrafficLightState = Red
    }
}

class TrafficLight {
    private var state: TrafficLightState = TrafficLightState.Red

    fun advance() {
        state = state.next()
    }

    fun current(): String = state::class.simpleName ?: "Unknown"
}

fun main() {
    val light = TrafficLight()
    repeat(4) {
        println(light.current())
        light.advance()
    }
}
