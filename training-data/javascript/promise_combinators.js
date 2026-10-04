const delay = (ms, value, fail = false) =>
  new Promise((resolve, reject) =>
    setTimeout(() => (fail ? reject(new Error(value)) : resolve(value)), ms)
  );

async function main() {
  const all = await Promise.all([delay(30, 'a'), delay(10, 'b'), delay(20, 'c')]);
  console.log('all:', all);

  const settled = await Promise.allSettled([
    delay(10, 'ok'),
    delay(15, 'broken', true),
  ]);
  for (const r of settled) {
    console.log(r.status, r.status === 'fulfilled' ? r.value : r.reason.message);
  }

  console.log('race:', await Promise.race([delay(50, 'slow'), delay(5, 'fast')]));

  const first = await Promise.any([delay(5, 'bad1', true), delay(20, 'good')]);
  console.log('any:', first);

  try {
    await Promise.any([delay(5, 'x', true), delay(6, 'y', true)]);
  } catch (e) {
    console.log(e.constructor.name, e.errors.map((err) => err.message));
  }
}

main();
