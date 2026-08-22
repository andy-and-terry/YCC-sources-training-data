function isAnagram(a: string, b: string): boolean {
  const normalize = (s: string): string =>
    s.replace(/\s/g, '').toLowerCase().split('').sort().join('');
  return normalize(a) === normalize(b);
}

console.log(isAnagram('listen', 'silent'));
console.log(isAnagram('hello', 'world'));
