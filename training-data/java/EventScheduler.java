import java.util.Comparator;
import java.util.PriorityQueue;

public class EventScheduler {
    record Event(double time, long seq, String name, Runnable action) {}

    private final PriorityQueue<Event> queue =
            new PriorityQueue<>(Comparator.comparingDouble(Event::time).thenComparingLong(Event::seq));
    private double now;
    private long seq;

    public void schedule(double delay, String name, Runnable action) {
        queue.add(new Event(now + delay, seq++, name, action));
    }

    public void run() {
        while (!queue.isEmpty()) {
            Event e = queue.poll();
            now = e.time();
            System.out.printf("t=%5.1f  %s%n", now, e.name());
            e.action().run();
        }
    }

    public static void main(String[] args) {
        EventScheduler sim = new EventScheduler();
        double[][] customers = {{0, 3}, {1, 2}, {1.5, 4}, {6, 1}};
        double[] serverFreeAt = {0};
        for (int i = 0; i < customers.length; i++) {
            final int id = i;
            double arrive = customers[i][0], service = customers[i][1];
            sim.schedule(arrive, "c" + id + " arrives", () -> {
                double start = Math.max(sim.now, serverFreeAt[0]);
                serverFreeAt[0] = start + service;
                sim.schedule(serverFreeAt[0] - sim.now, "c" + id + " done (waited " + (start - arrive) + ")", () -> {});
            });
        }
        sim.run();
    }
}
