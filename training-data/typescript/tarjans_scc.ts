class TarjanSCC {
  private index = 0;
  private stack: number[] = [];
  private onStack: boolean[];
  private indices: number[];
  private lowLink: number[];
  private readonly components: number[][] = [];

  constructor(private readonly graph: number[][]) {
    const n = graph.length;
    this.indices = new Array(n).fill(-1);
    this.lowLink = new Array(n).fill(-1);
    this.onStack = new Array(n).fill(false);
  }

  run(): number[][] {
    for (let v = 0; v < this.graph.length; v++) {
      if (this.indices[v] === -1) this.strongConnect(v);
    }
    return this.components;
  }

  private strongConnect(v: number): void {
    this.indices[v] = this.index;
    this.lowLink[v] = this.index;
    this.index++;
    this.stack.push(v);
    this.onStack[v] = true;

    for (const w of this.graph[v]) {
      if (this.indices[w] === -1) {
        this.strongConnect(w);
        this.lowLink[v] = Math.min(this.lowLink[v], this.lowLink[w]);
      } else if (this.onStack[w]) {
        this.lowLink[v] = Math.min(this.lowLink[v], this.indices[w]);
      }
    }

    if (this.lowLink[v] === this.indices[v]) {
      const component: number[] = [];
      let w: number;
      do {
        w = this.stack.pop()!;
        this.onStack[w] = false;
        component.push(w);
      } while (w !== v);
      this.components.push(component);
    }
  }
}

const graph: number[][] = [
  [1],
  [2],
  [0, 3],
  [4],
  [5],
  [3],
];

const sccs = new TarjanSCC(graph).run();
console.log(sccs);
