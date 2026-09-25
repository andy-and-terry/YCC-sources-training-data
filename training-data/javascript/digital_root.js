function digitalRootLoop(n) {
  while (n >= 10) n = [...String(n)].reduce((a, d) => a + Number(d), 0);
  return n;
}

const digitalRoot = (n) => (n === 0 ? 0 : 1 + ((n - 1) % 9));

for (const n of [0, 16, 942, 132189, 493193]) {
  console.assert(digitalRoot(n) === digitalRootLoop(n));
  console.log(n, digitalRoot(n));
}
module.exports = { digitalRoot };
