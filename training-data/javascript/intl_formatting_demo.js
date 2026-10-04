const amount = 1234567.891;

console.log(new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(amount));
console.log(new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'EUR' }).format(amount));
console.log(new Intl.NumberFormat('en', { notation: 'compact' }).format(amount));
console.log(new Intl.NumberFormat('en', { style: 'percent', maximumFractionDigits: 1 }).format(0.4567));

const date = new Date(Date.UTC(2024, 6, 4, 15, 30));
const opts = { dateStyle: 'full', timeStyle: 'short', timeZone: 'UTC' };
console.log(new Intl.DateTimeFormat('en-GB', opts).format(date));
console.log(new Intl.DateTimeFormat('ja-JP', opts).format(date));

const rtf = new Intl.RelativeTimeFormat('en', { numeric: 'auto' });
console.log(rtf.format(-1, 'day'), '|', rtf.format(3, 'week'));

const list = new Intl.ListFormat('en', { style: 'long', type: 'conjunction' });
console.log(list.format(['red', 'green', 'blue']));

const plural = new Intl.PluralRules('en', { type: 'ordinal' });
const suffix = { one: 'st', two: 'nd', few: 'rd', other: 'th' };
console.log([1, 2, 3, 4, 11, 21].map((n) => n + suffix[plural.select(n)]).join(' '));
