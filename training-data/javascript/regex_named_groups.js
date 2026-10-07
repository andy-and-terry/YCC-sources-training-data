// Named capture groups, matchAll, lookbehind and replace callbacks.
const dateRe = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;
const { groups } = dateRe.exec('Released on 2024-03-09.');
console.log(groups.year, groups.month, groups.day);

console.log('2024-03-09'.replace(dateRe, '$<day>/$<month>/$<year>'));

const text = 'a=1, b=22, c=333';
for (const m of text.matchAll(/(?<key>\w)=(?<val>\d+)/g)) {
  console.log(m.groups.key, Number(m.groups.val), m.index);
}

console.log('price: $42, cost: $7'.match(/(?<=\$)\d+/g));
console.log('foobar foobaz'.match(/foo(?!bar)\w+/)[0]);

console.log('hello world'.replace(/\b\w/g, (c) => c.toUpperCase()));
console.log(/^(?<w>\w+) \k<w>$/.test('bye bye'));
const sticky = /\d+/y;
sticky.lastIndex = 3;
console.log(sticky.exec('abc123')?.[0]);
