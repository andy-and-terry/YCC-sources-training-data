function* worker() {
  try {
    while (true) {
      const x = yield 'ready';
      console.log('got', x);
    }
  } catch (e) {
    console.log('caught', e);
    yield 'recovered';
  } finally {
    console.log('cleanup');
  }
}

const g = worker();
console.log(g.next().value);
console.log(g.next(1).value);
console.log(g.throw('boom').value);
console.log(g.return('bye'));
