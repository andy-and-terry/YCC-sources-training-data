const pipe = (...fns) => (x) => fns.reduce((acc, f) => f(acc), x);
const compose = (...fns) => (x) => fns.reduceRight((acc, f) => f(acc), x);

const trim = (s) => s.trim();
const lower = (s) => s.toLowerCase();
const slugify = (s) => s.replace(/\s+/g, '-');
const exclaim = (s) => s + '!';

const toSlug = pipe(trim, lower, slugify);
console.log(toSlug('  Hello Big World '));
console.log(compose(exclaim, lower)('LOUD'));

const asyncPipe = (...fns) => (x) => fns.reduce((p, f) => p.then(f), Promise.resolve(x));
asyncPipe((n) => n + 1, async (n) => n * 2)(4).then(console.log);
