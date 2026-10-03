// Bubble sort that alternates direction each pass, so both large values
// (bubbling right) and small values (bubbling left) move toward their
// final position every sweep instead of only one direction.
function cocktailShakerSort(arr) {
  const result = [...arr];
  let start = 0;
  let end = result.length - 1;
  let swapped = true;

  while (swapped) {
    swapped = false;
    for (let i = start; i < end; i++) {
      if (result[i] > result[i + 1]) {
        [result[i], result[i + 1]] = [result[i + 1], result[i]];
        swapped = true;
      }
    }
    end--;

    if (!swapped) break;
    swapped = false;
    for (let i = end; i > start; i--) {
      if (result[i - 1] > result[i]) {
        [result[i - 1], result[i]] = [result[i], result[i - 1]];
        swapped = true;
      }
    }
    start++;
  }
  return result;
}

console.log(cocktailShakerSort([5, 1, 4, 2, 8, 0, 2]));
module.exports = { cocktailShakerSort };
