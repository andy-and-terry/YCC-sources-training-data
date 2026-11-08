import java.util.*;
import java.util.concurrent.locks.*;

public class ReadWriteLockCache {
    private final Map<String, String> map = new HashMap<>();
    private final ReadWriteLock lock = new ReentrantReadWriteLock();

    String get(String k) {
        lock.readLock().lock();
        try { return map.get(k); } finally { lock.readLock().unlock(); }
    }

    void put(String k, String v) {
        lock.writeLock().lock();
        try { map.put(k, v); } finally { lock.writeLock().unlock(); }
    }

    public static void main(String[] args) {
        ReadWriteLockCache c = new ReadWriteLockCache();
        c.put("a", "1");
        System.out.println(c.get("a") + " " + c.get("b"));
    }
}
