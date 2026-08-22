class Singleton {
  static #instance = null;

  constructor(value) {
    if (Singleton.#instance) return Singleton.#instance;
    this.value = value;
    Singleton.#instance = this;
  }
}

const a = new Singleton(1);
const b = new Singleton(2);
console.log(a === b, a.value, b.value);
module.exports = { Singleton };
