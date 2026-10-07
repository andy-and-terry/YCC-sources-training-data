export function countAndSay(n: number): string {
  let s = "1";
  for (let k = 1; k < n; k++) {
    let next = "";
    for (let i = 0; i < s.length; ) {
      let j = i;
      while (j < s.length && s[j] === s[i]) j++;
      next += `${j - i}${s[i]}`;
      i = j;
    }
    s = next;
  }
  return s;
}

for (let i = 1; i <= 8; i++) console.log(i, countAndSay(i));
