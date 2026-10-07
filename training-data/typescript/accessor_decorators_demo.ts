function clamped(min: number, max: number) {
  return function (
    target: ClassAccessorDecoratorTarget<unknown, number>,
    context: ClassAccessorDecoratorContext<unknown, number>,
  ): ClassAccessorDecoratorResult<unknown, number> {
    return {
      get(this: unknown): number {
        return target.get.call(this);
      },
      set(this: unknown, value: number): void {
        target.set.call(this, Math.min(max, Math.max(min, value)));
      },
    };
  };
}

function traced<This, Value>(
  target: ClassAccessorDecoratorTarget<This, Value>,
  context: ClassAccessorDecoratorContext<This, Value>,
): ClassAccessorDecoratorResult<This, Value> {
  const name = String(context.name);
  return {
    set(this: This, value: Value): void {
      console.log(`setting ${name} = ${value}`);
      target.set.call(this, value);
    },
  };
}

class Dimmer {
  @clamped(0, 100)
  accessor brightness: number = 50;

  @traced
  accessor label: string = "dimmer";
}

const dimmer = new Dimmer();
dimmer.brightness = 150;
console.log(dimmer.brightness);

dimmer.brightness = -20;
console.log(dimmer.brightness);

dimmer.label = "kitchen-dimmer";
console.log(dimmer.label);
