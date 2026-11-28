function addBinary(a: string, b: string): string {
  let i = a.length - 1;
  let j = b.length - 1;
  let carry = 0;
  let out = "";
  while (i >= 0 || j >= 0 || carry) {
    const sum = carry + (i >= 0 ? Number(a[i--]) : 0) + (j >= 0 ? Number(b[j--]) : 0);
    out = String(sum % 2) + out;
    carry = sum >> 1;
  }
  return out;
}

console.log(addBinary("1010", "1011")); // 10101
