function* accumulator() {
  let total = 0;
  while (true) {
    const incoming = yield total;
    if (incoming === undefined) break;
    total += incoming;
  }
  return total;
}

const gen = accumulator();
gen.next();
console.log(gen.next(5).value);
console.log(gen.next(10).value);
console.log(gen.next(2.5).value);
console.log(gen.next());

function* guarded() {
  try {
    yield 1;
    yield 2;
  } finally {
    console.log("cleanup");
  }
}
const g = guarded();
g.next();
console.log(g.return("early"));
