import java.util.concurrent.atomic.AtomicReference;

public class VarHandleLikeAtomicRef {
    public static void main(String[] args) {
        AtomicReference<String> ref = new AtomicReference<>("a");
        System.out.println(ref.compareAndSet("a", "b"));
        System.out.println(ref.compareAndSet("a", "c"));
        System.out.println(ref.updateAndGet(s -> s + "!"));
    }
}
