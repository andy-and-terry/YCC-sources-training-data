function logged<This, Args extends unknown[], Return>(
  target: (this: This, ...args: Args) => Return,
  context: ClassMethodDecoratorContext<This, (this: This, ...args: Args) => Return>,
) {
  const name = String(context.name);
  return function (this: This, ...args: Args): Return {
    console.log(`calling ${name}(${args.join(', ')})`);
    const result = target.call(this, ...args);
    console.log(`${name} returned ${result}`);
    return result;
  };
}

function frozen<Class extends new (...args: any[]) => object>(target: Class, context: ClassDecoratorContext) {
  return class extends target {
    constructor(...args: any[]) {
      super(...args);
      Object.freeze(this);
    }
  };
}

@frozen
class Calculator {
  constructor(public base: number) {}

  @logged
  add(amount: number): number {
    return this.base + amount;
  }
}

const calc = new Calculator(10);
console.log(calc.add(5));

try {
  (calc as any).base = 100;
} catch {
  console.log('mutation blocked');
}
console.log(calc.base);
