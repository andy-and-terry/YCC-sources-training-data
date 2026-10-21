function toBT(n) {
  if (n === 0) return "0";
  let out = "";
  while (n !== 0) {
    const r = ((n % 3) + 3) % 3;
    if (r === 0) out = "0" + out;
    else if (r === 1) { out = "+" + out; n -= 1; }
    else { out = "-" + out; n += 1; }
    n /= 3;
  }
  return out;
}

const fromBT = (s) =>
  [...s].reduce((acc, c) => acc * 3 + (c === "+" ? 1 : c === "-" ? -1 : 0), 0);

for (const k of [-14, -1, 0, 5, 42]) {
  console.log(k, toBT(k), fromBT(toBT(k)) === k);
}
