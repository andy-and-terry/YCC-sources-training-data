const point = Object.freeze({ x: 1, y: 2 });
point.x = 100; // silently ignored (throws in strict mode / modules)
console.log(point);
console.log('is frozen:', Object.isFrozen(point));

const nested = Object.freeze({ inner: { value: 1 } });
nested.inner.value = 999; // freeze is shallow: nested objects stay mutable
console.log('shallow freeze leaks:', nested.inner.value);

function deepFreeze(obj) {
  Object.getOwnPropertyNames(obj).forEach((key) => {
    const value = obj[key];
    if (value && typeof value === 'object') deepFreeze(value);
  });
  return Object.freeze(obj);
}

const trulyFrozen = deepFreeze({ inner: { value: 1 } });
trulyFrozen.inner.value = 999;
console.log('deep freeze holds:', trulyFrozen.inner.value);

const sealed = Object.seal({ count: 1 });
sealed.count = 2; // existing properties can still change
sealed.extra = 'nope'; // adding new ones is blocked
console.log(sealed);

module.exports = { deepFreeze };
