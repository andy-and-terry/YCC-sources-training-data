import java.time.Duration;
import java.util.concurrent.Callable;
import java.util.concurrent.ThreadLocalRandom;
import java.util.function.Predicate;

public class RetryWithBackoff {
    public static <T> T retry(Callable<T> op, int maxAttempts, Duration base, Duration cap, Predicate<Exception> retryable) throws Exception {
        for (int attempt = 1; ; attempt++) {
            try {
                return op.call();
            } catch (Exception e) {
                if (attempt >= maxAttempts || !retryable.test(e)) throw e;
                long ceiling = Math.min(cap.toMillis(), base.toMillis() << attempt);
                long sleep = ThreadLocalRandom.current().nextLong(ceiling + 1);
                System.out.printf("attempt %d failed (%s), sleeping %dms%n", attempt, e.getMessage(), sleep);
                Thread.sleep(sleep);
            }
        }
    }

    public static void main(String[] args) throws Exception {
        int[] calls = {0};
        String result = retry(() -> {
            if (++calls[0] < 4) throw new java.io.IOException("connection reset");
            return "ok";
        }, 5, Duration.ofMillis(10), Duration.ofMillis(200), e -> e instanceof java.io.IOException);
        System.out.println(result + " after " + calls[0] + " calls");
    }
}
