const dateRe = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/u;
const m = "Released on 2024-03-09.".match(dateRe);
console.log(m.groups.year, m.groups.month, m.groups.day, m.index);

const swapped = "2024-03-09".replace(dateRe, "$<day>/$<month>/$<year>");
console.log(swapped);

const fn = "2024-03-09".replace(dateRe, (...args) => {
  const { year, month, day } = args.at(-1);
  return `${day}.${month}.${year}`;
});
console.log(fn);

const log = "ERROR db timeout; WARN disk 91%; ERROR net down";
for (const match of log.matchAll(/(?<level>ERROR|WARN) (?<msg>[^;]+)/g)) {
  console.log(match.groups.level, "->", match.groups.msg);
}

console.log(/(?<=\$)\d+(\.\d\d)?/.exec("cost: $42.50")[0]);
console.log("aBc".replace(/(?<!a)b/gi, "_"));
console.log(/(?<ch>.)\k<ch>/.test("hello"), /(?<ch>.)\k<ch>/.test("world"));

const sticky = /\d+/y;
sticky.lastIndex = 3;
console.log(sticky.exec("abc123")?.[0]);
