import java.util.concurrent.Phaser;

public class PhaserDemo {
    public static void main(String[] args) throws InterruptedException {
        // Phaser is a reusable barrier like CyclicBarrier, but parties can
        // register and deregister dynamically across phases instead of a
        // fixed party count fixed at construction time.
        Phaser phaser = new Phaser(1); // 1 party: the main thread itself

        int workerCount = 3;
        for (int i = 0; i < workerCount; i++) {
            int id = i;
            phaser.register();
            Thread worker = new Thread(() -> {
                for (int phase = 0; phase < 2; phase++) {
                    System.out.println("worker " + id + " working on phase " + phase);
                    phaser.arriveAndAwaitAdvance();
                }
            });
            worker.start();
        }

        for (int phase = 0; phase < 2; phase++) {
            phaser.arriveAndAwaitAdvance();
            System.out.println("main: phase " + phase + " complete");
        }
        phaser.arriveAndDeregister();
    }
}
