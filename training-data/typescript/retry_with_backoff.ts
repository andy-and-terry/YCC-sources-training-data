async function retryWithBackoff<T>(
  operation: () => Promise<T>,
  maxAttempts: number,
  baseDelayMs: number,
): Promise<T> {
  let lastError: unknown;
  for (let attempt = 1; attempt <= maxAttempts; attempt++) {
    try {
      return await operation();
    } catch (err) {
      lastError = err;
      if (attempt === maxAttempts) break;
      const delay = baseDelayMs * 2 ** (attempt - 1);
      await new Promise((resolve) => setTimeout(resolve, delay));
    }
  }
  throw lastError;
}

let attempts = 0;
async function flaky(): Promise<string> {
  attempts += 1;
  if (attempts < 3) {
    throw new Error(`attempt ${attempts} failed`);
  }
  return 'success';
}

retryWithBackoff(flaky, 5, 10).then((result) => {
  console.log(result, `after ${attempts} attempts`);
});
