const delay = <T>(value: T, ms: number, fail = false): Promise<T> =>
  new Promise((resolve, reject) =>
    setTimeout(() => (fail ? reject(new Error(`failed: ${value}`)) : resolve(value)), ms),
  );

async function main(): Promise<void> {
  const results = await Promise.allSettled([
    delay("a", 10),
    delay("b", 5, true),
    delay("c", 1),
  ]);

  for (const r of results) {
    if (r.status === "fulfilled") {
      console.log("ok", r.value);
    } else {
      console.log("error", (r.reason as Error).message);
    }
  }

  const fastest = await Promise.race([delay("slow", 30), delay("fast", 2)]);
  console.log("race:", fastest);

  const firstOk = await Promise.any([delay("x", 3, true), delay("y", 8)]);
  console.log("any:", firstOk);

  try {
    await Promise.all([delay(1, 1), delay(2, 2, true)]);
  } catch (e) {
    console.log("all rejected:", (e as Error).message);
  }

  try {
    await Promise.any([delay(1, 1, true), delay(2, 2, true)]);
  } catch (e) {
    console.log(e instanceof AggregateError, (e as AggregateError).errors.length);
  }
}

main();
