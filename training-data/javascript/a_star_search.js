function aStar(graph, start, goal, heuristic) {
  const openSet = [[heuristic(start), 0, start]];
  const cameFrom = new Map();
  const gScore = new Map([[start, 0]]);

  while (openSet.length > 0) {
    openSet.sort((a, b) => a[0] - b[0]);
    const [, cost, current] = openSet.shift();
    if (current === goal) {
      const path = [current];
      let node = current;
      while (cameFrom.has(node)) {
        node = cameFrom.get(node);
        path.push(node);
      }
      return { path: path.reverse(), cost };
    }

    for (const [neighbor, weight] of graph[current] || []) {
      const tentativeG = gScore.get(current) + weight;
      if (tentativeG < (gScore.get(neighbor) ?? Infinity)) {
        cameFrom.set(neighbor, current);
        gScore.set(neighbor, tentativeG);
        openSet.push([tentativeG + heuristic(neighbor), tentativeG, neighbor]);
      }
    }
  }
  return { path: null, cost: Infinity };
}

const graph = { A: [['B', 1], ['C', 4]], B: [['C', 1], ['D', 5]], C: [['D', 1]], D: [] };
console.log(aStar(graph, 'A', 'D', () => 0));
module.exports = { aStar };
