export interface Job { id: string; deadline: number; profit: number }

class DSU {
  private parent: number[];
  constructor(n: number) {
    this.parent = Array.from({ length: n }, (_, i) => i);
  }
  find(x: number): number {
    while (this.parent[x] !== x) x = this.parent[x] = this.parent[this.parent[x]];
    return x;
  }
  link(x: number, y: number): void {
    this.parent[x] = y;
  }
}

export function sequenceJobs(jobs: readonly Job[]): { order: string[]; profit: number } {
  const maxD = Math.max(...jobs.map((j) => j.deadline));
  const dsu = new DSU(maxD + 1);
  const slots: (Job | undefined)[] = new Array(maxD + 1);
  for (const job of [...jobs].sort((a, b) => b.profit - a.profit)) {
    const free = dsu.find(Math.min(job.deadline, maxD));
    if (free > 0) {
      slots[free] = job;
      dsu.link(free, free - 1);
    }
  }
  const chosen = slots.filter((j): j is Job => j !== undefined);
  return { order: chosen.map((j) => j.id), profit: chosen.reduce((s, j) => s + j.profit, 0) };
}

console.log(sequenceJobs([
  { id: "a", deadline: 2, profit: 100 },
  { id: "b", deadline: 1, profit: 19 },
  { id: "c", deadline: 2, profit: 27 },
  { id: "d", deadline: 1, profit: 25 },
  { id: "e", deadline: 3, profit: 15 },
]));
