interface TrafficLightState {
  next(light: TrafficLight): void;
  name(): string;
}

class RedState implements TrafficLightState {
  next(light: TrafficLight): void {
    light.setState(new GreenState());
  }
  name(): string {
    return "red";
  }
}

class GreenState implements TrafficLightState {
  next(light: TrafficLight): void {
    light.setState(new YellowState());
  }
  name(): string {
    return "green";
  }
}

class YellowState implements TrafficLightState {
  next(light: TrafficLight): void {
    light.setState(new RedState());
  }
  name(): string {
    return "yellow";
  }
}

class TrafficLight {
  private state: TrafficLightState = new RedState();

  setState(state: TrafficLightState): void {
    this.state = state;
  }

  advance(): void {
    this.state.next(this);
  }

  currentState(): string {
    return this.state.name();
  }
}

const light = new TrafficLight();
for (let i = 0; i < 4; i++) {
  console.log(light.currentState());
  light.advance();
}
