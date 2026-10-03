import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class CopyOnWriteArrayListDemo {
    public static void main(String[] args) {
        // Writes copy the whole backing array, so this shines when reads
        // vastly outnumber writes, such as a set of event listeners.
        List<String> listeners = new CopyOnWriteArrayList<>();
        listeners.add("logger");
        listeners.add("metrics");

        for (String listener : listeners) {
            if (listener.equals("logger")) {
                // safe to mutate mid-iteration: the iterator snapshots
                // the array as it was when it was created.
                listeners.add("audit");
            }
            System.out.println("notifying: " + listener);
        }

        System.out.println("final listeners: " + listeners);
    }
}
