interface ScheduledTask {
  id: number;
  runAt: number;
  interval?: number;
  fn: (now: number) => void;
}

/** Deterministic virtual-time scheduler supporting one-shot and repeating tasks. */
export class VirtualScheduler {
  private now = 0;
  private nextId = 1;
  private tasks: ScheduledTask[] = [];

  setTimeout(fn: (now: number) => void, delay: number): number {
    return this.add({ id: this.nextId++, runAt: this.now + delay, fn });
  }

  setInterval(fn: (now: number) => void, interval: number): number {
    return this.add({ id: this.nextId++, runAt: this.now + interval, interval, fn });
  }

  clear(id: number): void {
    this.tasks = this.tasks.filter((t) => t.id !== id);
  }

  advance(ms: number): void {
    const end = this.now + ms;
    for (;;) {
      const next = this.tasks[0];
      if (!next || next.runAt > end) break;
      this.tasks.shift();
      this.now = next.runAt;
      next.fn(this.now);
      if (next.interval !== undefined) this.add({ ...next, runAt: this.now + next.interval });
    }
    this.now = end;
  }

  private add(t: ScheduledTask): number {
    const i = this.tasks.findIndex((x) => x.runAt > t.runAt);
    this.tasks.splice(i < 0 ? this.tasks.length : i, 0, t);
    return t.id;
  }
}

const s = new VirtualScheduler();
const tick = s.setInterval((t) => console.log(`tick @${t}`), 300);
s.setTimeout((t) => console.log(`one-shot @${t}`), 450);
s.setTimeout((t) => {
  console.log(`stopping ticks @${t}`);
  s.clear(tick);
}, 1000);
s.advance(2000);
