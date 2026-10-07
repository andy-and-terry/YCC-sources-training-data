const sleep = (ms: number) => new Promise<void>((resolve) => setTimeout(resolve, ms));

async function retry<T>(
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
      if (attempt < maxAttempts) await sleep(baseDelayMs * 2 ** (attempt - 1));
    }
  }
  throw lastError;
}

async function main(): Promise<void> {
  const value = await retry(async (attempt) => {
    console.log(`attempt ${attempt}`);
    if (attempt < 3) throw new Error("transient failure");
    return "ok";
  });
  console.log(value);
}

main();
