class Temperature {
  #celsius = 0;

  constructor(celsius) {
    this.celsius = celsius;
  }

  get celsius() {
    return this.#celsius;
  }

  set celsius(value) {
    if (typeof value !== "number" || Number.isNaN(value)) {
      throw new TypeError("temperature must be a number");
    }
    if (value < -273.15) {
      throw new RangeError("below absolute zero");
    }
    this.#celsius = value;
  }

  get fahrenheit() {
    return (this.#celsius * 9) / 5 + 32;
  }

  set fahrenheit(f) {
    this.celsius = ((f - 32) * 5) / 9;
  }

  static get ABSOLUTE_ZERO() {
    return -273.15;
  }
}

const t = new Temperature(25);
console.log(t.celsius, t.fahrenheit);
t.fahrenheit = 212;
console.log(t.celsius);
console.log(Temperature.ABSOLUTE_ZERO);

for (const bad of [-500, "hot"]) {
  try {
    t.celsius = bad;
  } catch (e) {
    console.log(`${e.name}: ${e.message}`);
  }
}
console.log(Object.keys(t), JSON.stringify(t));
