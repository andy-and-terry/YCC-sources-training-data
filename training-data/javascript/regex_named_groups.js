const dateRe = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/u;
const m = '2024-03-15'.match(dateRe);
console.log(m.groups.year, m.groups.month, m.groups.day);

console.log('2024-03-15'.replace(dateRe, '$<day>/$<month>/$<year>'));

const log = 'ERR 12:01 disk full; WARN 12:05 slow; ERR 12:09 down';
for (const { groups } of log.matchAll(/(?<level>ERR|WARN) (?<time>[\d:]+)/g)) {
  console.log(groups.level, groups.time);
}

console.log('a1b22c333'.split(/(?<=\d)(?=[a-z])/));
console.log(/(?<!\$)\b\d+\b/.exec('cost $15 or 20')[0]);
