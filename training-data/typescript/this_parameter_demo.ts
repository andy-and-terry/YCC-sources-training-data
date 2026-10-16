interface Counter {
  count: number;
  increment(this: Counter, by?: number): Counter;
}

const counter: Counter = {
  count: 0,
  increment(this: Counter, by = 1) {
    this.count += by;
    return this;
  },
};

function describe(this: { name: string }, greeting: string): string {
  return `${greeting}, ${this.name}`;
}

counter.increment().increment(4);
console.log(counter.count);
console.log(describe.call({ name: "Grace" }, "Hello"));
const bound = describe.bind({ name: "Linus" });
console.log(bound("Hi"));
console.log(describe.apply({ name: "Ken" }, ["Hey"]));
