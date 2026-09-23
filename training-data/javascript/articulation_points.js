function findArticulationPoints(numNodes, edges) {
  const adj = Array.from({ length: numNodes }, () => []);
  for (const [u, v] of edges) {
    adj[u].push(v);
    adj[v].push(u);
  }

  const disc = new Array(numNodes).fill(-1);
  const low = new Array(numNodes).fill(-1);
  const articulation = new Set();
  let timer = 0;

  function dfs(u, parent) {
    disc[u] = timer;
    low[u] = timer;
    timer++;
    let children = 0;

    for (const v of adj[u]) {
      if (v === parent) continue;
      if (disc[v] !== -1) {
        low[u] = Math.min(low[u], disc[v]);
      } else {
        children++;
        dfs(v, u);
        low[u] = Math.min(low[u], low[v]);
        if (parent !== -1 && low[v] >= disc[u]) {
          articulation.add(u);
        }
      }
    }

    if (parent === -1 && children > 1) {
      articulation.add(u);
    }
  }

  for (let v = 0; v < numNodes; v++) {
    if (disc[v] === -1) dfs(v, -1);
  }

  return [...articulation].sort((a, b) => a - b);
}

// 0-1-2 triangle, 1 bridges to 3, 3 bridges to 4.
const edges = [[0, 1], [1, 2], [2, 0], [1, 3], [3, 4]];
console.log(findArticulationPoints(5, edges));
module.exports = { findArticulationPoints };
