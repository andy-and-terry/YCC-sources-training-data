function reverseWords(sentence) {
  const chars = [...sentence];
  const reverse = (i, j) => {
    while (i < j) {
      [chars[i], chars[j]] = [chars[j], chars[i]];
      i++;
      j--;
    }
  };
  reverse(0, chars.length - 1);
  let start = 0;
  for (let i = 0; i <= chars.length; i++) {
    if (i === chars.length || chars[i] === " ") {
      reverse(start, i - 1);
      start = i + 1;
    }
  }
  return chars.join("");
}

console.log(reverseWords("the sky is blue"));
console.log(reverseWords("one"));
