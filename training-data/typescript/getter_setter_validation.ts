class Temp {
  private _c = 0;
  get celsius() { return this._c; }
  set celsius(v: number) { if (v < -273.15) throw new RangeError("below absolute zero"); this._c = v; }
}
const t = new Temp(); t.celsius = 20; console.log(t.celsius);
