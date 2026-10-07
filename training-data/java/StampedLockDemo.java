import java.util.concurrent.locks.StampedLock;

public class StampedLockDemo {
    static class Point {
        private double x, y;
        private final StampedLock lock = new StampedLock();

        void move(double dx, double dy) {
            long s = lock.writeLock();
            try { x += dx; y += dy; } finally { lock.unlockWrite(s); }
        }

        double distanceFromOrigin() {
            long s = lock.tryOptimisticRead();
            double cx = x, cy = y;
            if (!lock.validate(s)) {
                s = lock.readLock();
                try { cx = x; cy = y; } finally { lock.unlockRead(s); }
            }
            return Math.sqrt(cx * cx + cy * cy);
        }
    }

    public static void main(String[] args) {
        Point p = new Point();
        p.move(3, 4);
        System.out.println(p.distanceFromOrigin());
    }
}
