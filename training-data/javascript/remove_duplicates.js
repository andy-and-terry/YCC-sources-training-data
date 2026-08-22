function removeDuplicatesOrdered(items) {
  return [...new Set(items)];
}

console.log(removeDuplicatesOrdered([1, 2, 2, 3, 1, 4]));
module.exports = { removeDuplicatesOrdered };
