function isPronic(n) {
  const k = Math.floor(Math.sqrt(n));
  return k * (k + 1) === n;
}

const out = [];
for (let n = 0; n < 100; n++) if (isPronic(n)) out.push(n);
console.log(out.join(" "));
