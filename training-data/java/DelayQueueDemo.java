import java.util.concurrent.DelayQueue;
import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

public class DelayQueueDemo {
    static class Task implements Delayed {
        final String name;
        final long readyAtNanos;

        Task(String name, long delayMillis) {
            this.name = name;
            this.readyAtNanos = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(delayMillis);
        }

        @Override
        public long getDelay(TimeUnit unit) {
            return unit.convert(readyAtNanos - System.nanoTime(), TimeUnit.NANOSECONDS);
        }

        @Override
        public int compareTo(Delayed other) {
            return Long.compare(readyAtNanos, ((Task) other).readyAtNanos);
        }
    }

    public static void main(String[] args) throws InterruptedException {
        DelayQueue<Task> queue = new DelayQueue<>();
        queue.put(new Task("third", 120));
        queue.put(new Task("first", 20));
        queue.put(new Task("second", 70));

        // Nothing has expired yet, so poll() returns null immediately.
        System.out.println("immediate poll: " + queue.poll());

        // take() blocks until the head element's delay has elapsed.
        for (int i = 0; i < 3; i++) {
            Task t = queue.take();
            System.out.println("ran " + t.name);
        }
        System.out.println("remaining: " + queue.size());
    }
}
