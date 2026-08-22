import java.util.concurrent.Callable;

public class CircuitBreaker {
    enum State { CLOSED, OPEN, HALF_OPEN }

    private final int failureThreshold;
    private final long resetTimeoutMs;
    private int failures = 0;
    private State state = State.CLOSED;
    private long openedAt = 0;

    public CircuitBreaker(int failureThreshold, long resetTimeoutMs) {
        this.failureThreshold = failureThreshold;
        this.resetTimeoutMs = resetTimeoutMs;
    }

    public <T> T call(Callable<T> fn) throws Exception {
        if (state == State.OPEN) {
            if (System.currentTimeMillis() - openedAt >= resetTimeoutMs) {
                state = State.HALF_OPEN;
            } else {
                throw new IllegalStateException("circuit is open");
            }
        }
        try {
            T result = fn.call();
            failures = 0;
            state = State.CLOSED;
            return result;
        } catch (Exception e) {
            failures++;
            if (failures >= failureThreshold) {
                state = State.OPEN;
                openedAt = System.currentTimeMillis();
            }
            throw e;
        }
    }

    public State getState() {
        return state;
    }

    public static void main(String[] args) {
        CircuitBreaker breaker = new CircuitBreaker(2, 100);
        for (int i = 0; i < 2; i++) {
            try {
                breaker.call(() -> { throw new RuntimeException("fail"); });
            } catch (Exception ignored) {
            }
        }
        System.out.println(breaker.getState());
    }
}
