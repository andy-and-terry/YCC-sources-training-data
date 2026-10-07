// Backtracking m-coloring: assigns each vertex a color 0..m-1 so no edge
// connects two same-colored vertices, undoing a choice and trying the
// next color whenever a later vertex gets stuck.
function colorGraph(graph, m, colors, vertex, vertexCount) {
  if (vertex === vertexCount) return true;

  for (let c = 0; c < m; c++) {
    if (isSafe(graph, colors, vertex, c)) {
      colors[vertex] = c;
      if (colorGraph(graph, m, colors, vertex + 1, vertexCount)) return true;
      colors[vertex] = -1;
    }
  }
  return false;
}

function isSafe(graph, colors, vertex, c) {
  for (const neighbor of graph[vertex] || []) {
    if (colors[neighbor] === c) return false;
  }
  return true;
}

const graph = { 0: [1, 2], 1: [0, 2], 2: [0, 1, 3], 3: [2] };
const vertexCount = 4;

let colors = new Array(vertexCount).fill(-1);
console.log('3-colorable:', colorGraph(graph, 3, colors, 0, vertexCount));
console.log(colors);

colors = new Array(vertexCount).fill(-1);
console.log('2-colorable:', colorGraph(graph, 2, colors, 0, vertexCount));
module.exports = { colorGraph };
