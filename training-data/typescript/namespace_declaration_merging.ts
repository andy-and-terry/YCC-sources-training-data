namespace Validation {
  export interface Validator {
    isValid(input: string): boolean;
  }

  export class LettersOnlyValidator implements Validator {
    isValid(input: string): boolean {
      return /^[A-Za-z]+$/.test(input);
    }
  }

  export class NumbersOnlyValidator implements Validator {
    isValid(input: string): boolean {
      return /^[0-9]+$/.test(input);
    }
  }
}

const validators: Validation.Validator[] = [
  new Validation.LettersOnlyValidator(),
  new Validation.NumbersOnlyValidator(),
];

for (const v of validators) {
  console.log(v.constructor.name, v.isValid("Hello"), v.isValid("12345"));
}

interface Widget {
  id: number;
}

// Declaration merging: this namespace adds a static-like member to the
// `Widget` interface's name without touching the interface itself.
namespace Widget {
  export function create(id: number): Widget {
    return { id };
  }

  export const defaultWidget: Widget = { id: 0 };
}

const w = Widget.create(7);
console.log(w, Widget.defaultWidget);

interface Box {
  width: number;
  height: number;
}

interface Box {
  depth: number;
}

const cube: Box = { width: 1, height: 1, depth: 1 };
console.log(cube);
