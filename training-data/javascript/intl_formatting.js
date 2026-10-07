// The built-in Intl API formats numbers, dates, lists, plurals and relative
// times without external libraries.
const n = 1234567.891;
console.log(new Intl.NumberFormat('en-US').format(n));
console.log(new Intl.NumberFormat('de-DE').format(n));
console.log(new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(n));
console.log(new Intl.NumberFormat('en', { notation: 'compact' }).format(n));
console.log(new Intl.NumberFormat('en', { style: 'percent' }).format(0.256));

const d = new Date(Date.UTC(2024, 0, 15, 13, 45));
console.log(new Intl.DateTimeFormat('en-US', { dateStyle: 'medium', timeZone: 'UTC' }).format(d));

console.log(new Intl.ListFormat('en', { type: 'conjunction' }).format(['a', 'b', 'c']));

const pr = new Intl.PluralRules('en', { type: 'ordinal' });
const suffix = { one: 'st', two: 'nd', few: 'rd', other: 'th' };
for (const i of [1, 2, 3, 4, 11, 22]) console.log(i + suffix[pr.select(i)]);

const rtf = new Intl.RelativeTimeFormat('en', { numeric: 'auto' });
console.log(rtf.format(-1, 'day'), '|', rtf.format(3, 'hour'));
