import std.stdio;

interface TrafficState {
    void next(TrafficLight light);
    string name();
}

class RedState : TrafficState {
    void next(TrafficLight light) { light.setState(new GreenState()); }
    string name() { return "Red"; }
}

class GreenState : TrafficState {
    void next(TrafficLight light) { light.setState(new YellowState()); }
    string name() { return "Green"; }
}

class YellowState : TrafficState {
    void next(TrafficLight light) { light.setState(new RedState()); }
    string name() { return "Yellow"; }
}

class TrafficLight {
    private TrafficState state;

    this() {
        state = new RedState();
    }

    void setState(TrafficState state) {
        this.state = state;
    }

    void advance() {
        state.next(this);
        writeln(state.name());
    }
}

void main() {
    auto light = new TrafficLight();
    foreach (i; 0 .. 4) light.advance();
}
