function zFunction(s: string): number[] {
  const n = s.length;
  const z = new Array<number>(n).fill(0);
  let left = 0;
  let right = 0;
  for (let i = 1; i < n; i++) {
    if (i < right) {
      z[i] = Math.min(right - i, z[i - left]);
    }
    while (i + z[i] < n && s[z[i]] === s[i + z[i]]) {
      z[i]++;
    }
    if (i + z[i] > right) {
      left = i;
      right = i + z[i];
    }
  }
  return z;
}

function findOccurrences(text: string, pattern: string): number[] {
  const combined = `${pattern}$${text}`;
  const z = zFunction(combined);
  const occurrences: number[] = [];
  for (let i = pattern.length + 1; i < combined.length; i++) {
    if (z[i] === pattern.length) {
      occurrences.push(i - pattern.length - 1);
    }
  }
  return occurrences;
}

console.log(zFunction("aabxaabxcaabxaabxay"));
console.log(findOccurrences("aabxaabxcaabxaabxay", "aabx"));
