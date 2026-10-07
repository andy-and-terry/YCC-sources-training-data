function hasCycleDirected(numNodes, edges) {
  const adj = Array.from({ length: numNodes }, () => []);
  for (const [u, v] of edges) adj[u].push(v);

  const WHITE = 0;
  const GRAY = 1;
  const BLACK = 2;
  const color = new Array(numNodes).fill(WHITE);

  function dfs(u) {
    color[u] = GRAY;
    for (const v of adj[u]) {
      if (color[v] === GRAY) return true;
      if (color[v] === WHITE && dfs(v)) return true;
    }
    color[u] = BLACK;
    return false;
  }

  for (let v = 0; v < numNodes; v++) {
    if (color[v] === WHITE && dfs(v)) return true;
  }
  return false;
}

console.log(hasCycleDirected(3, [[0, 1], [1, 2], [2, 0]])); // true
console.log(hasCycleDirected(4, [[0, 1], [0, 2], [1, 3], [2, 3]])); // false (DAG)
module.exports = { hasCycleDirected };
