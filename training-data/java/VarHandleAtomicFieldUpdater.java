import java.util.concurrent.atomic.*;

public class VarHandleAtomicFieldUpdater {
    volatile int hits;
    static final AtomicIntegerFieldUpdater<VarHandleAtomicFieldUpdater> U =
        AtomicIntegerFieldUpdater.newUpdater(VarHandleAtomicFieldUpdater.class, "hits");

    public static void main(String[] args) {
        VarHandleAtomicFieldUpdater o = new VarHandleAtomicFieldUpdater();
        U.incrementAndGet(o); U.addAndGet(o, 4);
        System.out.println(U.get(o) + " " + U.compareAndSet(o, 5, 9) + " " + o.hits);
    }
}
