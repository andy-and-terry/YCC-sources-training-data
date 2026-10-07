// Promise.all fails fast, allSettled reports every outcome, race takes the
// first to settle, and any takes the first to fulfil.
const delay = (ms, value, fail = false) =>
  new Promise((resolve, reject) =>
    setTimeout(() => (fail ? reject(new Error(value)) : resolve(value)), ms));

async function main() {
  console.log(await Promise.all([delay(10, 'a'), delay(5, 'b')]));

  try {
    await Promise.all([delay(10, 'ok'), delay(5, 'boom', true)]);
  } catch (e) {
    console.log('all rejected:', e.message);
  }

  const settled = await Promise.allSettled([delay(5, 'x'), delay(5, 'bad', true)]);
  console.log(settled.map((r) => r.status));

  console.log(await Promise.race([delay(30, 'slow'), delay(5, 'fast')]));
  console.log(await Promise.any([delay(5, 'err', true), delay(15, 'winner')]));

  try {
    await Promise.any([delay(5, 'e1', true), delay(5, 'e2', true)]);
  } catch (e) {
    console.log(e.constructor.name, e.errors.length);
  }
}
main();
