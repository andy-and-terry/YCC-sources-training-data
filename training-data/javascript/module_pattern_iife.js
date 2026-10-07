const counterModule = (function () {
  let count = 0;

  function increment(step = 1) {
    count += step;
    return count;
  }

  function reset() {
    count = 0;
  }

  function value() {
    return count;
  }

  return { increment, reset, value };
})();

counterModule.increment();
counterModule.increment(5);
console.log(counterModule.value());
counterModule.reset();
console.log(counterModule.value());
console.log(counterModule.count);

module.exports = { counterModule };
