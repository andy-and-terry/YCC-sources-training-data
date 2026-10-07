class MinHeap {
  constructor(cmp) { this.a = []; this.cmp = cmp; }
  get size() { return this.a.length; }
  peek() { return this.a[0]; }
  push(x) {
    const a = this.a;
    a.push(x);
    for (let i = a.length - 1; i > 0; ) {
      const p = (i - 1) >> 1;
      if (this.cmp(a[i], a[p]) >= 0) break;
      [a[i], a[p]] = [a[p], a[i]];
      i = p;
    }
  }
  pop() {
    const a = this.a, top = a[0], last = a.pop();
    if (a.length) {
      a[0] = last;
      for (let i = 0; ; ) {
        const l = 2 * i + 1, r = l + 1;
        let m = i;
        if (l < a.length && this.cmp(a[l], a[m]) < 0) m = l;
        if (r < a.length && this.cmp(a[r], a[m]) < 0) m = r;
        if (m === i) break;
        [a[i], a[m]] = [a[m], a[i]];
        i = m;
      }
    }
    return top;
  }
}

class EventScheduler {
  now = 0;
  #seq = 0;
  #q = new MinHeap((x, y) => x.time - y.time || x.seq - y.seq);
  schedule(delay, action) {
    this.#q.push({ time: this.now + delay, seq: this.#seq++, action });
  }
  run(until = Infinity) {
    while (this.#q.size && this.#q.peek().time <= until) {
      const ev = this.#q.pop();
      this.now = ev.time;
      ev.action();
    }
  }
}

const sim = new EventScheduler();
[[0, 3], [1, 2], [1.5, 4], [6, 1]].forEach(([arrive, service], i) =>
  sim.schedule(arrive, () => {
    console.log(`t=${sim.now.toFixed(1)} c${i} arrives`);
    sim.schedule(service, () => console.log(`t=${sim.now.toFixed(1)} c${i} leaves`));
  }),
);
sim.run();
module.exports = { EventScheduler };
