function generateGrayCode(n: number): number[] {
  const result: number[] = [0];
  for (let i = 0; i < n; i++) {
    const increment = 1 << i;
    for (let j = result.length - 1; j >= 0; j--) {
      result.push(result[j] + increment);
    }
  }
  return result;
}

function toBinaryString(value: number, bits: number): string {
  return value.toString(2).padStart(bits, '0');
}

const n = 3;
for (const code of generateGrayCode(n)) {
  console.log(toBinaryString(code, n));
}
