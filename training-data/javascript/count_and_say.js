function countAndSay(n) {
  let s = "1";
  for (let k = 1; k < n; k++) s = s.replace(/(\d)\1*/g, (run) => run.length + run[0]);
  return s;
}

for (let i = 1; i <= 8; i++) console.log(i, countAndSay(i));
module.exports = { countAndSay };
