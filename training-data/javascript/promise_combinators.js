const delay = (ms, value, fail = false) =>
  new Promise((resolve, reject) =>
    setTimeout(() => (fail ? reject(new Error(value)) : resolve(value)), ms)
  );

async function main() {
  const all = await Promise.all([delay(30, "a"), delay(10, "b"), delay(20, "c")]);
  console.log("all:", all);

  const settled = await Promise.allSettled([delay(10, "ok"), delay(5, "bad", true)]);
  console.log("allSettled:", settled.map((r) => r.status + ":" + (r.value ?? r.reason.message)));

  const race = await Promise.race([delay(40, "slow"), delay(5, "fast")]);
  console.log("race:", race);

  const any = await Promise.any([delay(5, "x", true), delay(15, "y"), delay(25, "z")]);
  console.log("any:", any);

  try {
    await Promise.any([delay(5, "e1", true), delay(8, "e2", true)]);
  } catch (err) {
    console.log(err.constructor.name, err.errors.map((e) => e.message));
  }

  try {
    await Promise.all([delay(10, "fine"), delay(5, "broken", true)]);
  } catch (err) {
    console.log("all rejected with:", err.message);
  }
}

main();
