import java.lang.invoke.*;

public class VarHandleCompareAndSet {
    volatile int counter;
    static final VarHandle COUNTER;
    static {
        try {
            COUNTER = MethodHandles.lookup().findVarHandle(VarHandleCompareAndSet.class, "counter", int.class);
        } catch (ReflectiveOperationException e) { throw new ExceptionInInitializerError(e); }
    }

    public static void main(String[] args) {
        var o = new VarHandleCompareAndSet();
        int old;
        do { old = o.counter; } while (!COUNTER.compareAndSet(o, old, old + 10));
        System.out.println(o.counter);
    }
}
