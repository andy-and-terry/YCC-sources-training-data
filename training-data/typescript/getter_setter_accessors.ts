class Temperature {
  private _celsius = 0;

  get celsius(): number {
    return this._celsius;
  }

  set celsius(value: number) {
    if (value < -273.15) {
      throw new RangeError("below absolute zero");
    }
    this._celsius = value;
  }

  get fahrenheit(): number {
    return this._celsius * 1.8 + 32;
  }

  set fahrenheit(value: number) {
    this.celsius = (value - 32) / 1.8;
  }

  get kelvin(): number {
    return this._celsius + 273.15;
  }
}

const t = new Temperature();
t.celsius = 100;
console.log(t.fahrenheit, t.kelvin);
t.fahrenheit = 32;
console.log(t.celsius);

try {
  t.celsius = -300;
} catch (e) {
  console.log((e as Error).message);
}

const desc = Object.getOwnPropertyDescriptor(Temperature.prototype, "kelvin");
console.log(typeof desc?.get, desc?.set);

const obj = {
  _n: 1,
  get double() {
    return this._n * 2;
  },
  set n(v: number) {
    this._n = v;
  },
};
obj.n = 21;
console.log(obj.double);
