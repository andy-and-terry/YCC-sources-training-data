import java.util.concurrent.Phaser;

public class PhaserDemo {
    public static void main(String[] args) throws InterruptedException {
        Phaser phaser = new Phaser(1);
        Thread[] ts = new Thread[3];
        for (int i = 0; i < ts.length; i++) {
            phaser.register();
            final int id = i;
            ts[i] = new Thread(() -> {
                for (int p = 0; p < 2; p++) {
                    phaser.arriveAndAwaitAdvance();
                }
                phaser.arriveAndDeregister();
            });
            ts[i].start();
        }
        for (int p = 0; p < 2; p++) {
            phaser.arriveAndAwaitAdvance();
            System.out.println("phase " + p + " complete");
        }
        phaser.arriveAndDeregister();
        for (Thread t : ts) t.join();
        System.out.println("terminated: " + phaser.isTerminated());
    }
}
