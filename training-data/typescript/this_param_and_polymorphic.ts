class Chain {
  value = 0;
  add(n: number): this { this.value += n; return this; }
}
class Sub extends Chain { double(): this { this.value *= 2; return this; } }
console.log(new Sub().add(2).double().add(1).value);
