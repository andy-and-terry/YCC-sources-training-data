function log(_t: unknown, ctx: ClassMethodDecoratorContext) {
  return function (this: unknown, ...args: unknown[]) {
    console.log(`call ${String(ctx.name)}`, args);
    return (_t as Function).apply(this, args);
  };
}
class Calc { @log add(a: number, b: number) { return a + b; } }
console.log(new Calc().add(1, 2));
