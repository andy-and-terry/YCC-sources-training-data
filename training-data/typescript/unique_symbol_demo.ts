const ID: unique symbol = Symbol("id");
const VERSION = Symbol.for("app.version");

interface Tagged {
  [ID]: number;
  label: string;
}

const item: Tagged = { [ID]: 7, label: "seven" };

class Registry {
  static readonly kind: unique symbol = Symbol("registry");
  [VERSION] = 3;
}

console.log(item[ID], Object.keys(item), Object.getOwnPropertySymbols(item).length);
console.log(new Registry()[VERSION], typeof Registry.kind);
console.log(ID.description, Symbol.keyFor(VERSION));
