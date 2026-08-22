class EventEmitter {
  #listeners = new Map();

  on(event, handler) {
    if (!this.#listeners.has(event)) {
      this.#listeners.set(event, new Set());
    }
    this.#listeners.get(event).add(handler);
    return () => this.off(event, handler);
  }

  once(event, handler) {
    const wrapper = (...args) => {
      this.off(event, wrapper);
      handler(...args);
    };
    return this.on(event, wrapper);
  }

  off(event, handler) {
    this.#listeners.get(event)?.delete(handler);
  }

  emit(event, ...args) {
    const handlers = this.#listeners.get(event);
    if (!handlers) return false;
    for (const handler of [...handlers]) {
      handler(...args);
    }
    return true;
  }
}

class RetryingFetcher extends EventEmitter {
  constructor(fetchFn, { maxRetries = 3, baseDelayMs = 100 } = {}) {
    super();
    this.fetchFn = fetchFn;
    this.maxRetries = maxRetries;
    this.baseDelayMs = baseDelayMs;
  }

  async fetchWithRetry(url) {
    let attempt = 0;
    while (true) {
      try {
        const result = await this.fetchFn(url);
        this.emit("success", { url, attempt });
        return result;
      } catch (err) {
        attempt += 1;
        this.emit("retry", { url, attempt, error: err });
        if (attempt > this.maxRetries) {
          this.emit("failure", { url, error: err });
          throw err;
        }
        const delay = this.baseDelayMs * 2 ** (attempt - 1);
        await new Promise((resolve) => setTimeout(resolve, delay));
      }
    }
  }
}

module.exports = { EventEmitter, RetryingFetcher };
