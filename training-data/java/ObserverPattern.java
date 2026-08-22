import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

public class ObserverPattern {
    static class Subject<T> {
        private final List<Consumer<T>> observers = new ArrayList<>();

        void subscribe(Consumer<T> observer) {
            observers.add(observer);
        }

        void notify(T value) {
            for (Consumer<T> observer : observers) observer.accept(value);
        }
    }

    static class TemperatureSensor extends Subject<Double> {
        void setTemperature(double value) {
            notify(value);
        }
    }

    public static void main(String[] args) {
        TemperatureSensor sensor = new TemperatureSensor();
        sensor.subscribe(t -> System.out.println("Alert: temperature is now " + t));
        sensor.setTemperature(25.5);
    }
}
