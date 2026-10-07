class Temperature {
  private _celsius = 0;

  get celsius(): number {
    return this._celsius;
  }

  set celsius(value: number) {
    if (value < -273.15) throw new RangeError("below absolute zero");
    this._celsius = value;
  }

  get fahrenheit(): number {
    return this._celsius * 9 / 5 + 32;
  }

  set fahrenheit(f: number) {
    this.celsius = (f - 32) * 5 / 9;
  }
}

const t = new Temperature();
t.celsius = 100;
console.log(t.fahrenheit);
t.fahrenheit = 32;
console.log(t.celsius);

try {
  t.celsius = -300;
} catch (e) {
  console.log((e as Error).message);
}

const obj = {
  _n: 1,
  get double() {
    return this._n * 2;
  },
};
console.log(obj.double);
