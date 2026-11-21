// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
const isMunchausen = (n: number): boolean =>
  String(n).split("").map(Number)
    .reduce((acc: number, d: number) => acc + (d === 0 ? 0 : d ** d), 0) === n;
const out: number[] = [];
for (let n = 1; n < 5000; n++) if (isMunchausen(n)) out.push(n);
console.log(out.join(" "));
