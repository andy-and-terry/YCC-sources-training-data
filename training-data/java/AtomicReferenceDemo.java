import java.util.concurrent.atomic.AtomicReference;

public class AtomicReferenceDemo {
    record Config(String name, int version) {}

    public static void main(String[] args) throws InterruptedException {
        AtomicReference<Config> ref = new AtomicReference<>(new Config("app", 1));

        Runnable bump = () -> {
            for (int i = 0; i < 1000; i++) {
                ref.updateAndGet(c -> new Config(c.name(), c.version() + 1));
            }
        };
        Thread a = new Thread(bump), b = new Thread(bump);
        a.start(); b.start();
        a.join(); b.join();
        System.out.println(ref.get());

        Config cur = ref.get();
        System.out.println(ref.compareAndSet(cur, new Config("new", 0)));
        System.out.println(ref.get());
    }
}
