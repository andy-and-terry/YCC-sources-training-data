function isAnagram(a, b) {
  const normalize = (s) => s.replace(/\s/g, '').toLowerCase().split('').sort().join('');
  return normalize(a) === normalize(b);
}

console.log(isAnagram('listen', 'silent'));
console.log(isAnagram('hello', 'world'));

module.exports = { isAnagram };
