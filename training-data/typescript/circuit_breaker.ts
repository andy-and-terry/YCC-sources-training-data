enum CircuitState {
  Closed = 'CLOSED',
  Open = 'OPEN',
  HalfOpen = 'HALF_OPEN',
}

class CircuitBreaker {
  private failures = 0;
  private state: CircuitState = CircuitState.Closed;
  private openedAt: number | null = null;

  constructor(private failureThreshold = 3, private resetTimeoutMs = 5000) {}

  async call<T>(fn: () => Promise<T>): Promise<T> {
    if (this.state === CircuitState.Open) {
      if (this.openedAt !== null && Date.now() - this.openedAt >= this.resetTimeoutMs) {
        this.state = CircuitState.HalfOpen;
      } else {
        throw new Error('circuit is open');
      }
    }

    try {
      const result = await fn();
      this.failures = 0;
      this.state = CircuitState.Closed;
      return result;
    } catch (err) {
      this.failures++;
      if (this.failures >= this.failureThreshold) {
        this.state = CircuitState.Open;
        this.openedAt = Date.now();
      }
      throw err;
    }
  }

  getState(): CircuitState {
    return this.state;
  }
}

export { CircuitBreaker, CircuitState };
