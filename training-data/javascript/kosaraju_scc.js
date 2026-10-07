function kosarajuSCC(numNodes, edges) {
  const adj = Array.from({ length: numNodes }, () => []);
  const reverseAdj = Array.from({ length: numNodes }, () => []);
  for (const [u, v] of edges) {
    adj[u].push(v);
    reverseAdj[v].push(u);
  }

  const visited = new Array(numNodes).fill(false);
  const order = [];

  function fillOrder(v) {
    visited[v] = true;
    for (const w of adj[v]) {
      if (!visited[w]) fillOrder(w);
    }
    order.push(v);
  }

  for (let v = 0; v < numNodes; v++) {
    if (!visited[v]) fillOrder(v);
  }

  const visited2 = new Array(numNodes).fill(false);
  const sccs = [];

  function collect(v, component) {
    visited2[v] = true;
    component.push(v);
    for (const w of reverseAdj[v]) {
      if (!visited2[w]) collect(w, component);
    }
  }

  for (let i = order.length - 1; i >= 0; i--) {
    const v = order[i];
    if (!visited2[v]) {
      const component = [];
      collect(v, component);
      sccs.push(component);
    }
  }

  return sccs;
}

const edges = [[0, 1], [1, 2], [2, 0], [1, 3], [3, 4]];
console.log(kosarajuSCC(5, edges));
module.exports = { kosarajuSCC };
