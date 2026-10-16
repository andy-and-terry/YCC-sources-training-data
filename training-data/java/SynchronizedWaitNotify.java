public class SynchronizedWaitNotify {
    private final Object lock = new Object();
    private boolean ready = false;
    private String message;

    void publish(String msg) {
        synchronized (lock) {
            message = msg;
            ready = true;
            lock.notifyAll();
        }
    }

    String await() throws InterruptedException {
        synchronized (lock) {
            while (!ready) lock.wait();
            return message;
        }
    }

    public static void main(String[] args) throws InterruptedException {
        SynchronizedWaitNotify box = new SynchronizedWaitNotify();
        Thread consumer = new Thread(() -> {
            try {
                System.out.println("got: " + box.await());
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
        consumer.start();
        Thread.sleep(100);
        box.publish("hello");
        consumer.join();
    }
}
