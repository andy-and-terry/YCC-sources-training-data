const compose = (...fns) => (x) => fns.reduceRight((acc, fn) => fn(acc), x);
const pipe = (...fns) => (x) => fns.reduce((acc, fn) => fn(acc), x);

const trim = (s) => s.trim();
const lower = (s) => s.toLowerCase();
const slugify = (s) => s.replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');

const makeSlug = pipe(trim, lower, slugify);
console.log(makeSlug('  Hello, World! Functional JS  '));

const add = (n) => (x) => x + n;
const mul = (n) => (x) => x * n;
console.log(compose(add(1), mul(2))(5));
console.log(pipe(add(1), mul(2))(5));

const pipeAsync = (...fns) => (x) =>
  fns.reduce((p, fn) => p.then(fn), Promise.resolve(x));

pipeAsync(
  (n) => n + 1,
  async (n) => n * 10,
  (n) => `result: ${n}`
)(4).then(console.log);

const tap = (fn) => (x) => {
  fn(x);
  return x;
};
console.log(pipe(add(2), tap((v) => console.log('debug', v)), mul(3))(1));
