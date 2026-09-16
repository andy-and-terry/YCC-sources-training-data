function longestPalindromicSubstring(s) {
  if (s.length < 2) return s;

  let start = 0;
  let maxLength = 1;

  const expandAroundCenter = (left, right) => {
    while (left >= 0 && right < s.length && s[left] === s[right]) {
      left--;
      right++;
    }
    const length = right - left - 1;
    if (length > maxLength) {
      maxLength = length;
      start = left + 1;
    }
  };

  for (let i = 0; i < s.length; i++) {
    expandAroundCenter(i, i);
    expandAroundCenter(i, i + 1);
  }

  return s.slice(start, start + maxLength);
}

console.log(longestPalindromicSubstring("babad"));
console.log(longestPalindromicSubstring("cbbd"));
console.log(longestPalindromicSubstring("racecar"));
module.exports = { longestPalindromicSubstring };
