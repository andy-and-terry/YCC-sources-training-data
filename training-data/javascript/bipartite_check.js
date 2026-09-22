function isBipartite(graph) {
  const color = {};
  for (const start in graph) {
    if (!(start in color)) {
      color[start] = 0;
      const queue = [start];
      while (queue.length) {
        const current = queue.shift();
        for (const neighbor of graph[current]) {
          if (!(neighbor in color)) {
            color[neighbor] = 1 - color[current];
            queue.push(neighbor);
          } else if (color[neighbor] === color[current]) {
            return false;
          }
        }
      }
    }
  }
  return true;
}

const graphA = { A: ['B', 'C'], B: ['A', 'D'], C: ['A', 'D'], D: ['B', 'C'] };
const graphB = { A: ['B', 'C'], B: ['A', 'C'], C: ['A', 'B'] };
console.log(isBipartite(graphA));
console.log(isBipartite(graphB));
module.exports = { isBipartite };
