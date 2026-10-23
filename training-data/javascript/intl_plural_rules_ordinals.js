const pr = new Intl.PluralRules('en-US', { type: 'ordinal' });
const suffixes = { one: 'st', two: 'nd', few: 'rd', other: 'th' };

function ordinal(n) {
  return n + suffixes[pr.select(n)];
}

console.log([1, 2, 3, 4, 11, 12, 21, 22, 103].map(ordinal).join(' '));
