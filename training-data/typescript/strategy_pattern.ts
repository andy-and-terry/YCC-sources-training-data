type SortStrategy = (items: number[]) => number[];

class SortContext {
  constructor(private strategy: SortStrategy) {}

  setStrategy(strategy: SortStrategy): void {
    this.strategy = strategy;
  }

  sort(items: number[]): number[] {
    return this.strategy(items);
  }
}

const ascending: SortStrategy = (items) => [...items].sort((a, b) => a - b);
const descending: SortStrategy = (items) => [...items].sort((a, b) => b - a);

const context = new SortContext(ascending);
console.log(context.sort([5, 3, 8, 1]));
context.setStrategy(descending);
console.log(context.sort([5, 3, 8, 1]));
