const sleep = (ms: number): Promise<void> => new Promise((resolve) => setTimeout(resolve, ms));

interface RetryOptions {
  retries: number;
  baseDelayMs: number;
  factor?: number;
}

async function retry<T>(fn: (attempt: number) => Promise<T>, opts: RetryOptions): Promise<T> {
  const factor = opts.factor ?? 2;
  let lastError: unknown;
  for (let attempt = 1; attempt <= opts.retries + 1; attempt++) {
    try {
      return await fn(attempt);
    } catch (err) {
      lastError = err;
      if (attempt > opts.retries) break;
      const delay = opts.baseDelayMs * factor ** (attempt - 1);
      console.log(`attempt ${attempt} failed, retrying in ${delay}ms`);
      await sleep(delay);
    }
  }
  throw lastError;
}

async function flaky(attempt: number): Promise<string> {
  if (attempt < 3) throw new Error(`boom ${attempt}`);
  return `success on attempt ${attempt}`;
}

async function main(): Promise<void> {
  console.log(await retry(flaky, { retries: 3, baseDelayMs: 5 }));
  try {
    await retry(async () => Promise.reject(new Error("always")), { retries: 1, baseDelayMs: 1 });
  } catch (e) {
    console.log("gave up:", (e as Error).message);
  }
}

main();
