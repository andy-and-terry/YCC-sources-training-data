function applyDefaults(config) {
  config.timeoutMs ??= 3000;
  config.retries ??= 0;
  config.label ||= 'unnamed';
  config.debug &&= config.debug === true;
  return config;
}

const configA = applyDefaults({ timeoutMs: 0, label: '', debug: 'yes' });
const configB = applyDefaults({ retries: 2, label: 'job-1', debug: true });

console.log(configA);
console.log(configB);

const cache = {};
function memoizedGreeting(name) {
  cache[name] ??= `Hello, ${name}!`;
  return cache[name];
}

console.log(memoizedGreeting('Ada'));
console.log(memoizedGreeting('Ada'));
console.log(cache);

module.exports = { applyDefaults, memoizedGreeting };
