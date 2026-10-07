class TrafficLightState {
  constructor(light) {
    this.light = light;
  }
  next() {
    throw new Error('not implemented');
  }
}

class RedState extends TrafficLightState {
  next() {
    this.light.setState(new GreenState(this.light));
  }
  toString() {
    return 'red';
  }
}

class GreenState extends TrafficLightState {
  next() {
    this.light.setState(new YellowState(this.light));
  }
  toString() {
    return 'green';
  }
}

class YellowState extends TrafficLightState {
  next() {
    this.light.setState(new RedState(this.light));
  }
  toString() {
    return 'yellow';
  }
}

class TrafficLight {
  constructor() {
    this.state = new RedState(this);
  }
  setState(state) {
    this.state = state;
  }
  change() {
    this.state.next();
    return this.state.toString();
  }
}

const light = new TrafficLight();
const sequence = [light.change(), light.change(), light.change(), light.change()];
console.log(sequence);
module.exports = { TrafficLight, RedState, GreenState, YellowState };
