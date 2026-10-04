const sleep = (ms: number) => new Promise<void>((resolve) => setTimeout(resolve, ms));

export async function retry<T>(
  task: (attempt: number) => Promise<T>,
  maxAttempts = 4,
  baseDelayMs = 10,
): Promise<T> {
  let lastError: unknown;
  for (let attempt = 1; attempt <= maxAttempts; attempt++) {
    try {
      return await task(attempt);
    } catch (err) {
      lastError = err;
      if (attempt < maxAttempts) {
        const delay = baseDelayMs * 2 ** (attempt - 1);
        console.log(`attempt ${attempt} failed, retrying in ${delay}ms`);
        await sleep(delay);
      }
    }
  }
  throw new Error(`gave up after ${maxAttempts} attempts`, { cause: lastError });
}

async function flaky(attempt: number): Promise<string> {
  if (attempt < 3) throw new Error("transient failure");
  return `ok on attempt ${attempt}`;
}

retry(flaky).then(console.log);
