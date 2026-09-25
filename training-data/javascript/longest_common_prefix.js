function longestCommonPrefix(words) {
  if (words.length === 0) return "";
  let prefix = words[0];
  for (const w of words.slice(1)) {
    while (!w.startsWith(prefix)) prefix = prefix.slice(0, -1);
    if (!prefix) break;
  }
  return prefix;
}

console.log(longestCommonPrefix(["flower", "flow", "flight"]));
console.log(JSON.stringify(longestCommonPrefix(["dog", "racecar", "car"])));
module.exports = { longestCommonPrefix };
