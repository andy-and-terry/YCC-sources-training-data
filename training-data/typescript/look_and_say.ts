export function nextTerm(s: string): string {
  let out = "";
  for (let i = 0; i < s.length; ) {
    let j = i;
    while (j < s.length && s[j] === s[i]) j++;
    out += `${j - i}${s[i]}`;
    i = j;
  }
  return out;
}

let term = "1";
for (let i = 0; i < 8; i++) {
  console.log(term);
  term = nextTerm(term);
}
