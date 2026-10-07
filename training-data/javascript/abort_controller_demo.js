function cancellableDelay(ms, signal) {
  return new Promise((resolve, reject) => {
    if (signal.aborted) return reject(new Error('aborted'));
    const timer = setTimeout(resolve, ms);
    signal.addEventListener('abort', () => {
      clearTimeout(timer);
      reject(new Error('aborted'));
    });
  });
}

async function main() {
  const controller = new AbortController();
  setTimeout(() => controller.abort(), 10);

  try {
    await cancellableDelay(1000, controller.signal);
    console.log('completed');
  } catch (err) {
    console.log('caught:', err.message);
  }

  const controller2 = new AbortController();
  try {
    await cancellableDelay(1, controller2.signal);
    console.log('completed second delay');
  } catch (err) {
    console.log('caught:', err.message);
  }
}

main();
module.exports = { cancellableDelay };
