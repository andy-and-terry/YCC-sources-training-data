function quickselect(nums, k) {
  const arr = [...nums];

  function partition(left, right, pivotIndex) {
    const pivotValue = arr[pivotIndex];
    [arr[pivotIndex], arr[right]] = [arr[right], arr[pivotIndex]];
    let storeIndex = left;
    for (let i = left; i < right; i++) {
      if (arr[i] < pivotValue) {
        [arr[i], arr[storeIndex]] = [arr[storeIndex], arr[i]];
        storeIndex++;
      }
    }
    [arr[right], arr[storeIndex]] = [arr[storeIndex], arr[right]];
    return storeIndex;
  }

  function select(left, right, k) {
    if (left === right) return arr[left];
    const pivotIndex = left + Math.floor(Math.random() * (right - left + 1));
    const newPivotIndex = partition(left, right, pivotIndex);
    if (k === newPivotIndex) return arr[k];
    if (k < newPivotIndex) return select(left, newPivotIndex - 1, k);
    return select(newPivotIndex + 1, right, k);
  }

  return select(0, arr.length - 1, k);
}

console.log(quickselect([7, 10, 4, 3, 20, 15], 3));
console.log(quickselect([1, 2, 3, 4, 5], 0));
module.exports = { quickselect };
