class MinHeap {
  #items = [];

  get size() {
    return this.#items.length;
  }

  push(item) {
    this.#items.push(item);
    let i = this.#items.length - 1;
    while (i > 0) {
      const parent = (i - 1) >> 1;
      if (this.#items[parent][0] <= this.#items[i][0]) break;
      [this.#items[parent], this.#items[i]] = [this.#items[i], this.#items[parent]];
      i = parent;
    }
  }

  pop() {
    const top = this.#items[0];
    const last = this.#items.pop();
    if (this.#items.length > 0) {
      this.#items[0] = last;
      let i = 0;
      while (true) {
        const left = 2 * i + 1;
        const right = 2 * i + 2;
        let smallest = i;
        if (left < this.#items.length && this.#items[left][0] < this.#items[smallest][0]) smallest = left;
        if (right < this.#items.length && this.#items[right][0] < this.#items[smallest][0]) smallest = right;
        if (smallest === i) break;
        [this.#items[smallest], this.#items[i]] = [this.#items[i], this.#items[smallest]];
        i = smallest;
      }
    }
    return top;
  }
}

function dijkstra(numNodes, adj, source) {
  const dist = new Array(numNodes).fill(Infinity);
  dist[source] = 0;
  const visited = new Array(numNodes).fill(false);
  const heap = new MinHeap();
  heap.push([0, source]);

  while (heap.size > 0) {
    const [d, u] = heap.pop();
    if (visited[u]) continue;
    visited[u] = true;

    for (const [v, w] of adj[u] || []) {
      const next = d + w;
      if (next < dist[v]) {
        dist[v] = next;
        heap.push([next, v]);
      }
    }
  }

  return dist;
}

const adj = {
  0: [[1, 4], [2, 1]],
  1: [[3, 1]],
  2: [[1, 2], [3, 5]],
  3: [],
};
console.log(dijkstra(4, adj, 0));
module.exports = { dijkstra, MinHeap };
