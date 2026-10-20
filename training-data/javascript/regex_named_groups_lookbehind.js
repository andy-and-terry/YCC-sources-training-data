const re = /(?<year>\d{4})-(?<month>\d{2})/u;
const { year, month } = "on 2023-07".match(re).groups;
console.log(year, month);
console.log("price: $42 and €50".match(/(?<=\$)\d+/)[0]);
for (const m of "a1b22c333".matchAll(/\d+/g)) console.log(m[0], m.index);
