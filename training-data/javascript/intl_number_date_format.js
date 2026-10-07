const price = 1234567.891;
const usd = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' });
console.log(usd.format(price));

const percent = new Intl.NumberFormat('en-US', { style: 'percent', maximumFractionDigits: 1 });
console.log(percent.format(0.4567));

const date = new Date(Date.UTC(2024, 2, 15));
const longDate = new Intl.DateTimeFormat('en-US', {
  year: 'numeric',
  month: 'long',
  day: 'numeric',
  timeZone: 'UTC',
});
console.log(longDate.format(date));

const collator = new Intl.Collator('en', { sensitivity: 'base' });
const words = ['banana', 'Apple', 'cherry'];
console.log([...words].sort(collator.compare));

module.exports = { usd, longDate };
