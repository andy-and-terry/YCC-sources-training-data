const d = new Date(Date.UTC(2024, 2, 15, 13, 45, 30));

console.log(d.toISOString());
console.log(new Intl.DateTimeFormat('en-US', { dateStyle: 'medium', timeZone: 'UTC' }).format(d));
console.log(new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'EUR' }).format(1234567.891));
console.log(new Intl.NumberFormat('en', { notation: 'compact' }).format(1234567));

const rtf = new Intl.RelativeTimeFormat('en', { numeric: 'auto' });
console.log(rtf.format(-1, 'day'), '/', rtf.format(3, 'hour'));

const addDays = (date, n) => new Date(date.getTime() + n * 86400000);
console.log(addDays(d, 30).toISOString().slice(0, 10));
console.log(['b', 'a', 'ä'].sort(new Intl.Collator('de').compare));
