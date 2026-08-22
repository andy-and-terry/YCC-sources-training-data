class SortContext {
  constructor(strategy) {
    this.strategy = strategy;
  }

  sort(items) {
    return this.strategy(items);
  }
}

const ascending = (items) => [...items].sort((a, b) => a - b);
const descending = (items) => [...items].sort((a, b) => b - a);

const context = new SortContext(ascending);
console.log(context.sort([5, 3, 8, 1]));
context.strategy = descending;
console.log(context.sort([5, 3, 8, 1]));
module.exports = { SortContext, ascending, descending };
