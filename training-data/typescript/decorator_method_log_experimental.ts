function log(_t: any, name: string, d: PropertyDescriptor) {
  const orig = d.value;
  d.value = function (...args: unknown[]) {
    console.log(`call ${name}`, args);
    return orig.apply(this, args);
  };
}

class Calc {
  @log
  add(a: number, b: number) { return a + b; }
}

console.log(new Calc().add(2, 3));
