import std.stdio;

interface Observer {
    void onUpdate(double temperature);
}

class ConsoleObserver : Observer {
    private string name;
    this(string name) { this.name = name; }

    void onUpdate(double temperature) {
        writeln(name, ": temperature is now ", temperature);
    }
}

class WeatherStation {
    private Observer[] observers;

    void subscribe(Observer o) {
        observers ~= o;
    }

    void setTemperature(double value) {
        foreach (o; observers) o.onUpdate(value);
    }
}

void main() {
    auto station = new WeatherStation();
    station.subscribe(new ConsoleObserver("sensor-a"));
    station.subscribe(new ConsoleObserver("sensor-b"));
    station.setTemperature(25.5);
}
