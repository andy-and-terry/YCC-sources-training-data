class TokenBucket {
  private tokens: number;
  private lastRefill: number;

  constructor(private capacity: number, private refillRate: number) {
    this.tokens = capacity;
    this.lastRefill = Date.now();
  }

  private refill(): void {
    const now = Date.now();
    const elapsedSeconds = (now - this.lastRefill) / 1000;
    this.tokens = Math.min(this.capacity, this.tokens + elapsedSeconds * this.refillRate);
    this.lastRefill = now;
  }

  tryConsume(tokens = 1): boolean {
    this.refill();
    if (this.tokens >= tokens) {
      this.tokens -= tokens;
      return true;
    }
    return false;
  }
}

const bucket = new TokenBucket(5, 1);
console.log(Array.from({ length: 7 }, () => bucket.tryConsume()));
