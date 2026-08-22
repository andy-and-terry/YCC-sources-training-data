class Graph {
  #adjacency = new Map();

  addEdge(u, v, { directed = false } = {}) {
    this.#addNode(u);
    this.#addNode(v);
    this.#adjacency.get(u).add(v);
    if (!directed) this.#adjacency.get(v).add(u);
  }

  #addNode(node) {
    if (!this.#adjacency.has(node)) this.#adjacency.set(node, new Set());
  }

  bfs(start) {
    const visited = new Set([start]);
    const order = [];
    const queue = [start];

    while (queue.length > 0) {
      const node = queue.shift();
      order.push(node);
      for (const neighbor of this.#adjacency.get(node) ?? []) {
        if (!visited.has(neighbor)) {
          visited.add(neighbor);
          queue.push(neighbor);
        }
      }
    }
    return order;
  }

  dfs(start) {
    const visited = new Set();
    const order = [];

    const visit = (node) => {
      if (visited.has(node)) return;
      visited.add(node);
      order.push(node);
      for (const neighbor of this.#adjacency.get(node) ?? []) {
        visit(neighbor);
      }
    };

    visit(start);
    return order;
  }

  hasCycle() {
    const visited = new Set();
    const inStack = new Set();

    const visit = (node) => {
      visited.add(node);
      inStack.add(node);
      for (const neighbor of this.#adjacency.get(node) ?? []) {
        if (!visited.has(neighbor)) {
          if (visit(neighbor)) return true;
        } else if (inStack.has(neighbor)) {
          return true;
        }
      }
      inStack.delete(node);
      return false;
    };

    for (const node of this.#adjacency.keys()) {
      if (!visited.has(node) && visit(node)) return true;
    }
    return false;
  }
}

module.exports = { Graph };
