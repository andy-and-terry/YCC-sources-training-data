function compress(s) {
  return s.replace(/(.)\1*/g, (run, ch) => (run.length > 1 ? ch + run.length : ch));
}
console.log(compress("aaabccdddd"));
