function plusOne(digits) {
  const out = [...digits];
  for (let i = out.length - 1; i >= 0; i--) {
    if (out[i] < 9) {
      out[i]++;
      return out;
    }
    out[i] = 0;
  }
  return [1, ...out];
}

console.log(plusOne([1, 2, 9])); // [ 1, 3, 0 ]
console.log(plusOne([9, 9])); // [ 1, 0, 0 ]
