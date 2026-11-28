type Action =
  | { type: "add"; n: number }
  | { type: "reset" }
  | { type: "mul"; k: number };

function reduce(state: number, a: Action): number {
  switch (a.type) {
    case "add": return state + a.n;
    case "mul": return state * a.k;
    case "reset": return 0;
  }
}

console.log([{ type: "add", n: 2 }, { type: "mul", k: 5 }].reduce(reduce as any, 1));
