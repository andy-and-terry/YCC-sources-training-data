const delay = (ms, value, fail = false) =>
  new Promise((resolve, reject) =>
    setTimeout(() => (fail ? reject(new Error(value)) : resolve(value)), ms)
  );

async function main() {
  console.log(await Promise.all([delay(30, "a"), delay(10, "b")]));
  console.log(await Promise.race([delay(30, "slow"), delay(10, "fast")]));
  console.log(await Promise.any([delay(10, "err", true), delay(20, "ok")]));

  const settled = await Promise.allSettled([delay(5, "yes"), delay(5, "no", true)]);
  for (const r of settled) {
    console.log(r.status, r.status === "fulfilled" ? r.value : r.reason.message);
  }

  const { promise, resolve } = Promise.withResolvers();
  setTimeout(() => resolve("resolved externally"), 5);
  console.log(await promise);
}

main();
