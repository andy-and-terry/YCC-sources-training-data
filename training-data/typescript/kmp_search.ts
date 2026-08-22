function buildLPS(pattern: string): number[] {
  const lps = new Array(pattern.length).fill(0);
  let length = 0;
  let i = 1;
  while (i < pattern.length) {
    if (pattern[i] === pattern[length]) {
      length++;
      lps[i] = length;
      i++;
    } else if (length !== 0) {
      length = lps[length - 1];
    } else {
      lps[i] = 0;
      i++;
    }
  }
  return lps;
}

function kmpSearch(text: string, pattern: string): number[] {
  if (!pattern) return [];
  const lps = buildLPS(pattern);
  const matches: number[] = [];
  let i = 0;
  let j = 0;
  while (i < text.length) {
    if (text[i] === pattern[j]) {
      i++;
      j++;
      if (j === pattern.length) {
        matches.push(i - j);
        j = lps[j - 1];
      }
    } else if (j !== 0) {
      j = lps[j - 1];
    } else {
      i++;
    }
  }
  return matches;
}

console.log(kmpSearch('abxabcabcaby', 'abcaby'));
