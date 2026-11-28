function columnTitle(n: number): string {
  let out = "";
  while (n > 0) {
    n--;
    out = String.fromCharCode(65 + (n % 26)) + out;
    n = Math.floor(n / 26);
  }
  return out;
}

function columnNumber(title: string): number {
  return [...title].reduce((acc, ch) => acc * 26 + ch.charCodeAt(0) - 64, 0);
}

console.log(columnTitle(701), columnNumber("AB")); // ZY 28
