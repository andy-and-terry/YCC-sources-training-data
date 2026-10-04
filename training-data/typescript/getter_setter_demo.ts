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

  static get ABSOLUTE_ZERO(): number {
    return -273.15;
  }
}

const t = new Temperature();
t.celsius = 100;
console.log(t.fahrenheit);
t.fahrenheit = 32;
console.log(t.celsius);
try {
  t.celsius = -500;
} catch (e) {
  console.log((e as Error).message);
}
console.log(Temperature.ABSOLUTE_ZERO);
