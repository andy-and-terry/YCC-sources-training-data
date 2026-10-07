// Proxy.revocable gives back both the proxy and a revoke() function, so
// access to an object can be cut off later without the caller needing a
// reference to the original target.
const target = { secret: 'classified' };
const { proxy, revoke } = Proxy.revocable(target, {
  get(obj, prop) {
    console.log(`reading "${prop}"`);
    return obj[prop];
  },
});

console.log(proxy.secret);
revoke();

try {
  console.log(proxy.secret);
} catch (err) {
  console.log('access after revoke throws:', err instanceof TypeError);
}

module.exports = { target };
