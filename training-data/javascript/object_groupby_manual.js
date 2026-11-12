function groupBy(items, keyFn) {
  return items.reduce((acc, it) => {
    (acc[keyFn(it)] ||= []).push(it);
    return acc;
  }, {});
}
console.log(groupBy([1, 2, 3, 4, 5, 6], (n) => (n % 2 ? "odd" : "even")));
