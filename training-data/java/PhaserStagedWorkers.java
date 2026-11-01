import java.util.concurrent.Phaser;

public class PhaserStagedWorkers {
    public static void main(String[] args) throws Exception {
        Phaser ph = new Phaser(1);
        for (int i = 0; i < 3; i++) {
            ph.register();
            int id = i;
            new Thread(() -> {
                System.out.println("w" + id + " stage1");
                ph.arriveAndAwaitAdvance();
                System.out.println("w" + id + " stage2");
                ph.arriveAndDeregister();
            }).start();
        }
        ph.arriveAndDeregister();
    }
}
