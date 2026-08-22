function flatten(items) {
  return items.reduce(
    (acc, item) => acc.concat(Array.isArray(item) ? flatten(item) : item),
    []
  );
}

console.log(flatten([1, [2, 3, [4, [5, 6]], 7]]));

module.exports = { flatten };
