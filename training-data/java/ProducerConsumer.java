import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicBoolean;

public class ProducerConsumer {
    private static final int QUEUE_CAPACITY = 10;
    private static final Object POISON_PILL = new Object();

    static class Producer implements Runnable {
        private final BlockingQueue<Object> queue;
        private final int itemCount;

        Producer(BlockingQueue<Object> queue, int itemCount) {
            this.queue = queue;
            this.itemCount = itemCount;
        }

        @Override
        public void run() {
            try {
                for (int i = 0; i < itemCount; i++) {
                    queue.put("item-" + i);
                }
                queue.put(POISON_PILL);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }

    static class Consumer implements Runnable {
        private final BlockingQueue<Object> queue;
        private final AtomicBoolean running = new AtomicBoolean(true);

        Consumer(BlockingQueue<Object> queue) {
            this.queue = queue;
        }

        @Override
        public void run() {
            try {
                while (running.get()) {
                    Object item = queue.take();
                    if (item == POISON_PILL) {
                        queue.put(POISON_PILL);
                        running.set(false);
                        break;
                    }
                    System.out.println("Consumed: " + item);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static void main(String[] args) throws InterruptedException {
        BlockingQueue<Object> queue = new LinkedBlockingQueue<>(QUEUE_CAPACITY);
        Thread producer = new Thread(new Producer(queue, 20));
        Thread consumer = new Thread(new Consumer(queue));

        producer.start();
        consumer.start();

        producer.join();
        consumer.join();
    }
}
