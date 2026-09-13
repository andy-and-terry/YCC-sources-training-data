interface TrafficLightState {
    TrafficLightState next()
    String color()
}

class RedState implements TrafficLightState {
    TrafficLightState next() { return new GreenState() }
    String color() { return "Red" }
}

class GreenState implements TrafficLightState {
    TrafficLightState next() { return new YellowState() }
    String color() { return "Green" }
}

class YellowState implements TrafficLightState {
    TrafficLightState next() { return new RedState() }
    String color() { return "Yellow" }
}

class TrafficLight {
    TrafficLightState state = new RedState()

    void advance() {
        state = state.next()
    }
}

def light = new TrafficLight()
4.times {
    println light.state.color()
    light.advance()
}
