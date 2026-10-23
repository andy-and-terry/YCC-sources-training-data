const { promisify } = require('util');

function divide(a, b, callback) {
  setTimeout(() => {
    if (b === 0) {
      callback(new Error('division by zero'));
    } else {
      callback(null, a / b);
    }
  }, 5);
}

const divideAsync = promisify(divide);

async function main() {
  console.log(await divideAsync(10, 4));
  try {
    await divideAsync(1, 0);
  } catch (e) {
    console.log('caught:', e.message);
  }

  const sleep = promisify(setTimeout);
  const value = await sleep(5, 'slept');
  console.log(value);
}

main();
