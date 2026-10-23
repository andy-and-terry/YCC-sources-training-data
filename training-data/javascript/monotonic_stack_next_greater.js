// For each element, find the next strictly greater value (or -1).
function nextGreater(arr) {
  const res = new Array(arr.length).fill(-1);
  const stack = []; // indices whose answer is still unknown
  arr.forEach((v, i) => {
    while (stack.length && arr[stack[stack.length - 1]] < v) {
      res[stack.pop()] = v;
    }
    stack.push(i);
  });
  return res;
}

console.log(nextGreater([4, 5, 2, 25, 7, 8]));
console.log(nextGreater([3, 2, 1]));
