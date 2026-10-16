class Category {
  private children: Category[] = [];
  constructor(public readonly name: string) {}

  add(child: Category): this {
    this.children.push(child);
    return this;
  }

  *[Symbol.iterator](): Generator<[string, number]> {
    yield* this.walk(0);
  }

  private *walk(depth: number): Generator<[string, number]> {
    yield [this.name, depth];
    for (const child of this.children) yield* child.walk(depth);
  }
}

const root = new Category("root")
  .add(new Category("fruit").add(new Category("apple")).add(new Category("pear")))
  .add(new Category("veg").add(new Category("kale")));

for (const [name, depth] of root) {
  console.log(`${"-".repeat(depth)}${name}`);
}
console.log([...root].length);
