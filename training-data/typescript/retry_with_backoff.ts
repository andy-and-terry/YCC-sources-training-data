export interface RetryOptions {
  attempts: number;
  baseMs: number;
  maxMs: number;
  isRetryable?: (err: unknown) => boolean;
  onRetry?: (attempt: number, delay: number, err: unknown) => void;
}

const sleep = (ms: number): Promise<void> => new Promise((r) => setTimeout(r, ms));

/** Exponential backoff with "decorrelated jitter". */
export async function withRetry<T>(op: (attempt: number) => Promise<T>, opts: RetryOptions): Promise<T> {
  let delay = opts.baseMs;
  for (let attempt = 1; ; attempt++) {
    try {
      return await op(attempt);
    } catch (err) {
      if (attempt >= opts.attempts || !(opts.isRetryable?.(err) ?? true)) throw err;
      delay = Math.min(opts.maxMs, opts.baseMs + Math.random() * (delay * 3 - opts.baseMs));
      opts.onRetry?.(attempt, delay, err);
      await sleep(delay);
    }
  }
}

class HttpError extends Error {
  constructor(readonly status: number) {
    super(`HTTP ${status}`);
  }
}

let calls = 0;
withRetry(
  async () => {
    calls++;
    if (calls < 3) throw new HttpError(503);
    return { ok: true, calls };
  },
  {
    attempts: 5,
    baseMs: 10,
    maxMs: 100,
    isRetryable: (e) => e instanceof HttpError && e.status >= 500,
    onRetry: (a, d, e) => console.log(`attempt ${a} failed: ${(e as Error).message}; waiting ${d.toFixed(0)}ms`),
  },
).then((r) => console.log(r));
