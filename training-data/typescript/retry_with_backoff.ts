const sleep = (ms: number): Promise<void> => new Promise((r) => setTimeout(r, ms));

async function retry<T>(
  fn: (attempt: number) => Promise<T>,
  retries = 4,
  baseMs = 5
): Promise<T> {
  let lastError: unknown;
  for (let attempt = 1; attempt <= retries; attempt++) {
    try {
      return await fn(attempt);
    } catch (err) {
      lastError = err;
      const wait = baseMs * 2 ** (attempt - 1);
      console.log(`attempt ${attempt} failed, waiting ${wait}ms`);
      await sleep(wait);
    }
  }
  throw lastError;
}

retry(async (n) => {
  if (n < 3) throw new Error("flaky");
  return `succeeded on attempt ${n}`;
}).then(console.log);
