function tarjanSCC(numNodes, edges) {
  const adjacency = Array.from({ length: numNodes }, () => []);
  for (const [u, v] of edges) adjacency[u].push(v);

  const indices = new Array(numNodes).fill(-1);
  const lowlink = new Array(numNodes).fill(-1);
  const onStack = new Array(numNodes).fill(false);
  const stack = [];
  const components = [];
  let index = 0;

  function strongConnect(v) {
    indices[v] = index;
    lowlink[v] = index;
    index++;
    stack.push(v);
    onStack[v] = true;

    for (const w of adjacency[v]) {
      if (indices[w] === -1) {
        strongConnect(w);
        lowlink[v] = Math.min(lowlink[v], lowlink[w]);
      } else if (onStack[w]) {
        lowlink[v] = Math.min(lowlink[v], indices[w]);
      }
    }

    if (lowlink[v] === indices[v]) {
      const component = [];
      let w;
      do {
        w = stack.pop();
        onStack[w] = false;
        component.push(w);
      } while (w !== v);
      components.push(component);
    }
  }

  for (let v = 0; v < numNodes; v++) {
    if (indices[v] === -1) strongConnect(v);
  }
  return components;
}

const edges = [[0, 1], [1, 2], [2, 0], [1, 3], [3, 4], [4, 5], [5, 3], [5, 6]];
console.log(tarjanSCC(7, edges));
module.exports = { tarjanSCC };
