function connectedComponents(n: number, edges: Array<[number, number]>): number[][] {
  const adj: number[][] = Array.from({ length: n }, () => []);
  for (const [a, b] of edges) {
    adj[a].push(b);
    adj[b].push(a);
  }
  const seen = new Array<boolean>(n).fill(false);
  const groups: number[][] = [];
  for (let start = 0; start < n; start++) {
    if (seen[start]) continue;
    const group: number[] = [];
    const stack = [start];
    seen[start] = true;
    while (stack.length > 0) {
      const v = stack.pop()!;
      group.push(v);
      for (const w of adj[v]) {
        if (!seen[w]) {
          seen[w] = true;
          stack.push(w);
        }
      }
    }
    groups.push(group.sort((a, b) => a - b));
  }
  return groups;
}

console.log(connectedComponents(7, [[0, 1], [1, 2], [3, 4], [5, 5]]));
