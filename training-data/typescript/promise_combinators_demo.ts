const delay = <T>(value: T, ms: number, fail = false): Promise<T> =>
  new Promise((resolve, reject) =>
    setTimeout(() => (fail ? reject(new Error(String(value))) : resolve(value)), ms),
  );

async function main(): Promise<void> {
  const all = await Promise.all([delay(1, 20), delay(2, 10), delay(3, 5)]);
  console.log("all:", all);

  const race = await Promise.race([delay("slow", 30), delay("fast", 5)]);
  console.log("race:", race);

  const settled = await Promise.allSettled([delay("good", 5), delay("bad", 5, true)]);
  for (const s of settled) {
    if (s.status === "fulfilled") console.log("fulfilled:", s.value);
    else console.log("rejected:", (s.reason as Error).message);
  }

  const any = await Promise.any([delay("e1", 5, true), delay("winner", 15)]);
  console.log("any:", any);
}

main();
