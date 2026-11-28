function addBinary(a, b) {
  let i = a.length - 1, j = b.length - 1, carry = 0, out = "";
  while (i >= 0 || j >= 0 || carry) {
    const sum = carry + (i >= 0 ? +a[i--] : 0) + (j >= 0 ? +b[j--] : 0);
    out = (sum % 2) + out;
    carry = sum >> 1;
  }
  return out;
}

console.log(addBinary("1010", "1011")); // 10101
