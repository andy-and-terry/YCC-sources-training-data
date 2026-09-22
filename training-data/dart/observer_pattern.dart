abstract class Observer {
  void onUpdate(double temperature);
}

class ConsoleObserver implements Observer {
  final String name;
  ConsoleObserver(this.name);

  @override
  void onUpdate(double temperature) {
    print('$name: temperature is now $temperature');
  }
}

class WeatherStation {
  final List<Observer> _observers = [];

  void subscribe(Observer observer) => _observers.add(observer);

  void setTemperature(double value) {
    for (final observer in _observers) {
      observer.onUpdate(value);
    }
  }
}

void main() {
  final station = WeatherStation();
  station.subscribe(ConsoleObserver('sensor-a'));
  station.subscribe(ConsoleObserver('sensor-b'));
  station.setTemperature(25.5);
}
