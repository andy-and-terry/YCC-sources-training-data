function canFinish(numCourses: number, prerequisites: Array<[number, number]>): boolean {
  const indegree = new Array<number>(numCourses).fill(0);
  const next: number[][] = Array.from({ length: numCourses }, () => []);
  for (const [course, prereq] of prerequisites) {
    next[prereq].push(course);
    indegree[course]++;
  }
  const queue: number[] = [];
  indegree.forEach((d, i) => {
    if (d === 0) queue.push(i);
  });
  let taken = 0;
  while (queue.length > 0) {
    const c = queue.shift()!;
    taken++;
    for (const n of next[c]) {
      if (--indegree[n] === 0) queue.push(n);
    }
  }
  return taken === numCourses;
}

console.log(canFinish(2, [[1, 0]]));
console.log(canFinish(2, [[1, 0], [0, 1]]));
