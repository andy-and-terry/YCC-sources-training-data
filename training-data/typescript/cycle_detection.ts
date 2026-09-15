function hasCycle(graph: Map<number, number[]>, nodeCount: number): boolean {
  const state: number[] = new Array(nodeCount).fill(0); // 0 = unvisited, 1 = in progress, 2 = done

  function dfs(node: number): boolean {
    state[node] = 1;
    for (const neighbor of graph.get(node) ?? []) {
      if (state[neighbor] === 1) return true;
      if (state[neighbor] === 0 && dfs(neighbor)) return true;
    }
    state[node] = 2;
    return false;
  }

  for (let node = 0; node < nodeCount; node++) {
    if (state[node] === 0 && dfs(node)) return true;
  }
  return false;
}

const acyclic = new Map([
  [0, [1, 2]],
  [1, [3]],
  [2, [3]],
  [3, []],
]);
const cyclic = new Map([
  [0, [1]],
  [1, [2]],
  [2, [0]],
]);

console.log(hasCycle(acyclic, 4)); // false
console.log(hasCycle(cyclic, 3));  // true
