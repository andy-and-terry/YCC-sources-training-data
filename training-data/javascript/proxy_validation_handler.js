const target = { age: 0 };
const p = new Proxy(target, {
  set(obj, key, value) {
    if (key === 'age' && !Number.isInteger(value)) throw new TypeError('age must be an integer');
    obj[key] = value;
    return true;
  },
  get(obj, key) { return key in obj ? obj[key] : `no ${String(key)}`; },
});
p.age = 30;
console.log(p.age, p.name);
try { p.age = 'x'; } catch (e) { console.log(e.message); }
