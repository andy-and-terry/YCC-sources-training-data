interface TrafficState : Object {
    public abstract string name();
    public abstract TrafficState next();
}

class RedState : Object, TrafficState {
    public string name() {
        return "red";
    }
    public TrafficState next() {
        return new GreenState();
    }
}

class GreenState : Object, TrafficState {
    public string name() {
        return "green";
    }
    public TrafficState next() {
        return new YellowState();
    }
}

class YellowState : Object, TrafficState {
    public string name() {
        return "yellow";
    }
    public TrafficState next() {
        return new RedState();
    }
}

class TrafficLight : Object {
    TrafficState state = new RedState();

    public void tick() {
        stdout.printf("light is %s\n", state.name());
        state = state.next();
    }
}

void main() {
    var light = new TrafficLight();
    for (int i = 0; i < 5; i++) {
        light.tick();
    }
}
