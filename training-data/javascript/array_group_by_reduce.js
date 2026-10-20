// Group array items by a key function using reduce.
const groupBy = (items, keyFn) =>
  items.reduce((acc, item) => {
    (acc[keyFn(item)] ||= []).push(item);
    return acc;
  }, {});

const words = ["apple", "avocado", "banana", "blueberry", "cherry"];
console.log(groupBy(words, (w) => w[0]));
console.log(groupBy([1, 2, 3, 4, 5, 6], (n) => (n % 2 ? "odd" : "even")));
