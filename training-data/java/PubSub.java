import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

public class PubSub {
    private final Map<String, List<Consumer<String>>> subscribers = new HashMap<>();

    public void subscribe(String topic, Consumer<String> handler) {
        subscribers.computeIfAbsent(topic, t -> new ArrayList<>()).add(handler);
    }

    public void publish(String topic, String message) {
        for (Consumer<String> handler : subscribers.getOrDefault(topic, List.of())) {
            handler.accept(message);
        }
    }

    public static void main(String[] args) {
        PubSub bus = new PubSub();
        bus.subscribe("news", msg -> System.out.println("received: " + msg));
        bus.publish("news", "hello subscribers");
    }
}
