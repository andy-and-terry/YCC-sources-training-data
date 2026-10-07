const delay = <T>(ms: number, value: T, fail = false): Promise<T> =>
  new Promise((resolve, reject) =>
    setTimeout(() => (fail ? reject(new Error(`failed: ${String(value)}`)) : resolve(value)), ms)
  );

async function main(): Promise<void> {
  const results = await Promise.allSettled([
    delay(10, "a"),
    delay(5, "b", true),
    delay(1, "c"),
  ]);

  for (const r of results) {
    if (r.status === "fulfilled") console.log("ok", r.value);
    else console.log("rejected", (r.reason as Error).message);
  }

  const first = await Promise.race([delay(20, "slow"), delay(2, "fast")]);
  console.log("race winner:", first);
}

main();
