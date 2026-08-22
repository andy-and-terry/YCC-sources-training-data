const State = { CLOSED: 'CLOSED', OPEN: 'OPEN', HALF_OPEN: 'HALF_OPEN' };

class CircuitBreaker {
  constructor(failureThreshold = 3, resetTimeoutMs = 5000) {
    this.failureThreshold = failureThreshold;
    this.resetTimeoutMs = resetTimeoutMs;
    this.failures = 0;
    this.state = State.CLOSED;
    this.openedAt = null;
  }

  async call(fn, ...args) {
    if (this.state === State.OPEN) {
      if (Date.now() - this.openedAt >= this.resetTimeoutMs) {
        this.state = State.HALF_OPEN;
      } else {
        throw new Error('circuit is open');
      }
    }

    try {
      const result = await fn(...args);
      this.failures = 0;
      this.state = State.CLOSED;
      return result;
    } catch (err) {
      this.failures++;
      if (this.failures >= this.failureThreshold) {
        this.state = State.OPEN;
        this.openedAt = Date.now();
      }
      throw err;
    }
  }
}

module.exports = { CircuitBreaker, State };
