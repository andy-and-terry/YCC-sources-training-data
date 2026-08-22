using System;

class TokenBucketRateLimiter
{
    private readonly double capacity;
    private double tokens;
    private readonly double refillRate;
    private DateTime lastRefill;

    public TokenBucketRateLimiter(double capacity, double refillRate)
    {
        this.capacity = capacity;
        tokens = capacity;
        this.refillRate = refillRate;
        lastRefill = DateTime.UtcNow;
    }

    private void Refill()
    {
        var now = DateTime.UtcNow;
        double elapsed = (now - lastRefill).TotalSeconds;
        tokens = Math.Min(capacity, tokens + elapsed * refillRate);
        lastRefill = now;
    }

    public bool TryConsume(double amount)
    {
        Refill();
        if (tokens >= amount)
        {
            tokens -= amount;
            return true;
        }
        return false;
    }

    static void Main()
    {
        var bucket = new TokenBucketRateLimiter(5, 1);
        for (int i = 0; i < 7; i++) Console.Write(bucket.TryConsume(1) + " ");
        Console.WriteLine();
    }
}
