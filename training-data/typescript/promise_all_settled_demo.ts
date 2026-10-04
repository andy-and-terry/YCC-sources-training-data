const delay = <T>(ms: number, value: T, fail = false): Promise<T> =>
  new Promise((resolve, reject) =>
    setTimeout(() => (fail ? reject(new Error(`failed: ${value}`)) : resolve(value)), ms)
  );

async function main(): Promise<void> {
  const results = await Promise.allSettled([
    delay(30, "a"),
    delay(10, "b", true),
    delay(20, "c"),
  ]);

  for (const r of results) {
    if (r.status === "fulfilled") console.log("ok", r.value);
    else console.log("error", (r.reason as Error).message);
  }

  const fastest = await Promise.race([delay(50, "slow"), delay(5, "fast")]);
  console.log("race winner:", fastest);

  try {
    await Promise.all([delay(5, "x"), delay(1, "y", true)]);
  } catch (e) {
    console.log("all rejected:", (e as Error).message);
  }
}

main();
