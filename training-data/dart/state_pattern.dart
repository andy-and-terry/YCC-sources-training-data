abstract class TrafficState {
  void next(TrafficLight light);
  String get name;
}

class RedState implements TrafficState {
  @override
  void next(TrafficLight light) => light.state = GreenState();

  @override
  String get name => 'Red';
}

class GreenState implements TrafficState {
  @override
  void next(TrafficLight light) => light.state = YellowState();

  @override
  String get name => 'Green';
}

class YellowState implements TrafficState {
  @override
  void next(TrafficLight light) => light.state = RedState();

  @override
  String get name => 'Yellow';
}

class TrafficLight {
  TrafficState state = RedState();

  void advance() {
    state.next(this);
    print(state.name);
  }
}

void main() {
  final light = TrafficLight();
  for (var i = 0; i < 4; i++) {
    light.advance();
  }
}
