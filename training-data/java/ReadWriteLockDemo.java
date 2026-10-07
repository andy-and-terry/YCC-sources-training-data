import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class ReadWriteLockDemo {
    static class ConcurrentCache<K, V> {
        private final Map<K, V> data = new HashMap<>();
        private final ReadWriteLock lock = new ReentrantReadWriteLock();

        V get(K key) {
            lock.readLock().lock();
            try {
                return data.get(key);
            } finally {
                lock.readLock().unlock();
            }
        }

        void put(K key, V value) {
            lock.writeLock().lock();
            try {
                data.put(key, value);
            } finally {
                lock.writeLock().unlock();
            }
        }

        int size() {
            lock.readLock().lock();
            try {
                return data.size();
            } finally {
                lock.readLock().unlock();
            }
        }
    }

    public static void main(String[] args) throws InterruptedException {
        ConcurrentCache<String, Integer> cache = new ConcurrentCache<>();

        Thread writer = new Thread(() -> {
            for (int i = 0; i < 100; i++) cache.put("key" + i, i);
        });
        Thread reader = new Thread(() -> {
            for (int i = 0; i < 100; i++) cache.get("key" + i);
        });

        writer.start();
        writer.join();
        reader.start();
        reader.join();

        System.out.println("cache size: " + cache.size());
    }
}
