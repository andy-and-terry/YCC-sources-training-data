function delay(ms: number, signal: AbortSignal): Promise<string> {
  return new Promise((resolve, reject) => {
    if (signal.aborted) return reject(signal.reason);
    const timer = setTimeout(() => resolve(`done after ${ms}ms`), ms);
    signal.addEventListener(
      "abort",
      () => {
        clearTimeout(timer);
        reject(signal.reason);
      },
      { once: true },
    );
  });
}

async function run(): Promise<void> {
  const quick = new AbortController();
  console.log(await delay(10, quick.signal));

  const slow = new AbortController();
  const pending = delay(1000, slow.signal);
  setTimeout(() => slow.abort(new Error("cancelled by caller")), 20);
  try {
    await pending;
  } catch (e) {
    console.log("slow:", (e as Error).message);
  }

  try {
    await delay(1000, AbortSignal.timeout(30));
  } catch (e) {
    console.log("timeout:", (e as Error).name);
  }
}

run();
