class Registry {
  static #instances = 0;
  static idPrefix;

  static {
    Registry.idPrefix = 'REG';
    Registry.#instances = 0;
  }

  #id;
  #secret;

  constructor(secret) {
    Registry.#instances += 1;
    this.#id = `${Registry.idPrefix}-${Registry.#instances}`;
    this.#secret = secret;
  }

  get id() {
    return this.#id;
  }

  #reveal() {
    return this.#secret;
  }

  describe() {
    return `${this.#id}: ${this.#reveal()}`;
  }

  static get count() {
    return Registry.#instances;
  }
}

const r1 = new Registry('alpha');
const r2 = new Registry('beta');

console.log(r1.describe());
console.log(r2.describe());
console.log(Registry.count);

module.exports = { Registry };
