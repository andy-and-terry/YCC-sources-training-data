function reactive(target, onChange) {
  return new Proxy(target, {
    get(obj, key, receiver) {
      return Reflect.get(obj, key, receiver);
    },
    set(obj, key, value, receiver) {
      const oldValue = obj[key];
      const result = Reflect.set(obj, key, value, receiver);
      if (oldValue !== value) onChange(key, oldValue, value);
      return result;
    },
  });
}

const log = [];
const state = reactive({ count: 0, name: 'counter' }, (key, oldValue, newValue) => {
  log.push(`${key}: ${oldValue} -> ${newValue}`);
});

state.count = 1;
state.count += 1;
state.name = 'clicker';

console.log(state.count, state.name);
console.log(log);
module.exports = { reactive };
