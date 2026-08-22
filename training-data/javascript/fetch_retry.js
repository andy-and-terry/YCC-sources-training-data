async function fetchWithRetry(fetchFn, url, { maxRetries = 3, baseDelayMs = 100 } = {}) {
  let attempt = 0;
  while (true) {
    try {
      return await fetchFn(url);
    } catch (err) {
      attempt += 1;
      if (attempt > maxRetries) throw err;
      const delay = baseDelayMs * 2 ** (attempt - 1);
      await new Promise((resolve) => setTimeout(resolve, delay));
    }
  }
}

async function main() {
  let calls = 0;
  const flakyFetch = async (url) => {
    calls++;
    if (calls < 3) throw new Error('simulated failure');
    return `response from ${url}`;
  };
  console.log(await fetchWithRetry(flakyFetch, 'https://example.com'));
}

main();
module.exports = { fetchWithRetry };
