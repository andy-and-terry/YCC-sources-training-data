import java.util.concurrent.locks.StampedLock;

public class StampedLockDemo {
    private final StampedLock lock = new StampedLock();
    private double x, y;

    public void move(double dx, double dy) {
        long stamp = lock.writeLock();
        try {
            x += dx;
            y += dy;
        } finally {
            lock.unlockWrite(stamp);
        }
    }

    // Tries an optimistic (lock-free) read first; only falls back to a
    // full read lock if a concurrent write invalidated the stamp.
    public double distanceFromOrigin() {
        long stamp = lock.tryOptimisticRead();
        double curX = x, curY = y;
        if (!lock.validate(stamp)) {
            stamp = lock.readLock();
            try {
                curX = x;
                curY = y;
            } finally {
                lock.unlockRead(stamp);
            }
        }
        return Math.sqrt(curX * curX + curY * curY);
    }

    public static void main(String[] args) {
        StampedLockDemo point = new StampedLockDemo();
        point.move(3, 4);
        System.out.println("distance: " + point.distanceFromOrigin());
    }
}
