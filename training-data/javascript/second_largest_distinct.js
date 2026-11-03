function secondLargest(values) {
  const distinct = [...new Set(values)].sort((a, b) => b - a);
  return distinct.length > 1 ? distinct[1] : null;
}

console.log(secondLargest([5, 3, 9, 9, 1]));
console.log(secondLargest([2, 2]));
