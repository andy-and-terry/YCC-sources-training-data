// ThisType<T> types `this` inside methods of an object literal.
type CounterMethods = {
  increment(by?: number): void;
  reset(): void;
  describe(): string;
};

type CounterState = { count: number };

function makeCounter(
  methods: CounterMethods & ThisType<CounterState & CounterMethods>,
  initial = 0,
): CounterState & CounterMethods {
  return { count: initial, ...methods };
}

const counter = makeCounter({
  increment(by = 1) {
    this.count += by;
  },
  reset() {
    this.count = 0;
  },
  describe() {
    return `count is ${this.count}`;
  },
});

counter.increment();
counter.increment(5);
console.log(counter.describe());
counter.reset();
console.log(counter.describe());
