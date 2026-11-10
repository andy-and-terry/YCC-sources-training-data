const limit = 80;
const flags = new Array(limit + 1).fill(true);
flags[0] = flags[1] = false;
for (let i = 2; i * i <= limit; i++) {
  if (flags[i]) for (let j = i * i; j <= limit; j += i) flags[j] = false;
}
const pairs = [];
for (let p = 2; p + 2 <= limit; p++) {
  if (flags[p] && flags[p + 2]) pairs.push(`(${p},${p + 2})`);
}
console.log(pairs.join(" ")); // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
