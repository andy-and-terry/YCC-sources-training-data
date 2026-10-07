class Temperature {
  #celsius = 0;
  get fahrenheit() { return this.#celsius * 9 / 5 + 32; }
  set fahrenheit(f) { this.#celsius = (f - 32) * 5 / 9; }
  get celsius() { return this.#celsius; }
}

const t = new Temperature();
t.fahrenheit = 212;
console.log(t.celsius, t.fahrenheit);

const obj = {};
Object.defineProperty(obj, 'id', { value: 42, enumerable: false, writable: false });
obj.id = 1;
console.log(obj.id, Object.keys(obj), JSON.stringify(obj));

const frozen = Object.freeze({ a: 1, nested: { b: 2 } });
frozen.a = 99;
frozen.nested.b = 3;
console.log(frozen);
