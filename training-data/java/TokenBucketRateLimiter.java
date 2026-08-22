public class TokenBucketRateLimiter {
    private final double capacity;
    private double tokens;
    private final double refillRate;
    private long lastRefill;

    public TokenBucketRateLimiter(double capacity, double refillRate) {
        this.capacity = capacity;
        this.tokens = capacity;
        this.refillRate = refillRate;
        this.lastRefill = System.nanoTime();
    }

    private void refill() {
        long now = System.nanoTime();
        double elapsedSeconds = (now - lastRefill) / 1_000_000_000.0;
        tokens = Math.min(capacity, tokens + elapsedSeconds * refillRate);
        lastRefill = now;
    }

    public synchronized boolean tryConsume(double amount) {
        refill();
        if (tokens >= amount) {
            tokens -= amount;
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
        TokenBucketRateLimiter bucket = new TokenBucketRateLimiter(5, 1);
        for (int i = 0; i < 7; i++) {
            System.out.print(bucket.tryConsume(1) + " ");
        }
        System.out.println();
    }
}
