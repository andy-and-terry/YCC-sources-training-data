import java.util.ArrayDeque;
import java.util.Deque;
import java.util.function.Supplier;

public class ObjectPoolPattern {
    static class Connection {
        private final int id;

        Connection(int id) {
            this.id = id;
        }

        void query(String sql) {
            System.out.println("connection " + id + " running: " + sql);
        }

        @Override
        public String toString() {
            return "Connection#" + id;
        }
    }

    static class ConnectionPool {
        private final Deque<Connection> available = new ArrayDeque<>();
        private final Supplier<Connection> factory;
        private final int maxSize;
        private int created = 0;

        ConnectionPool(int maxSize, Supplier<Connection> factory) {
            this.maxSize = maxSize;
            this.factory = factory;
        }

        synchronized Connection acquire() {
            if (!available.isEmpty()) {
                return available.pop();
            }
            if (created < maxSize) {
                created++;
                return factory.get();
            }
            throw new IllegalStateException("pool exhausted");
        }

        synchronized void release(Connection connection) {
            available.push(connection);
        }

        synchronized int idleCount() {
            return available.size();
        }
    }

    public static void main(String[] args) {
        int[] nextId = {0};
        ConnectionPool pool = new ConnectionPool(2, () -> new Connection(nextId[0]++));

        Connection first = pool.acquire();
        Connection second = pool.acquire();
        first.query("SELECT 1");
        second.query("SELECT 2");

        pool.release(first);
        Connection reused = pool.acquire();
        System.out.println("reused same instance: " + (reused == first));

        pool.release(reused);
        pool.release(second);
        System.out.println("idle connections: " + pool.idleCount());
    }
}
