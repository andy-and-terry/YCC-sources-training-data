function powerSet(items) {
  return items.reduce(
    (subsets, item) => subsets.concat(subsets.map((set) => [...set, item])),
    [[]]
  );
}

console.log(powerSet([1, 2, 3]));
module.exports = { powerSet };
