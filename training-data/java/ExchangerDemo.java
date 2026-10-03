import java.util.concurrent.Exchanger;

public class ExchangerDemo {
    public static void main(String[] args) throws InterruptedException {
        Exchanger<String> exchanger = new Exchanger<>();

        Thread producer = new Thread(() -> {
            try {
                String filled = "batch-of-work";
                System.out.println("producer handing off: " + filled);
                String empty = exchanger.exchange(filled);
                System.out.println("producer received back: " + empty);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        Thread consumer = new Thread(() -> {
            try {
                String received = exchanger.exchange("empty-buffer");
                System.out.println("consumer received: " + received);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        producer.start();
        consumer.start();
        producer.join();
        consumer.join();
    }
}
