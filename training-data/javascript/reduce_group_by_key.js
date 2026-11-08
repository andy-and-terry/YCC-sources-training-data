const groupBy = (items, keyFn) =>
  items.reduce((acc, item) => {
    (acc[keyFn(item)] ||= []).push(item);
    return acc;
  }, {});

console.log(groupBy([1, 2, 3, 4, 5, 6], (n) => (n % 2 ? "odd" : "even")));
console.log(groupBy(["apple", "avocado", "banana"], (s) => s[0]));
