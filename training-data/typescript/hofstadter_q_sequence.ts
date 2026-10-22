// Q(n) = Q(n - Q(n - 1)) + Q(n - Q(n - 2)), Q(1) = Q(2) = 1
function hofstadterQ(count: number): number[] {
  const q: number[] = [0, 1, 1];
  for (let n = 3; n <= count; n++) q[n] = q[n - q[n - 1]] + q[n - q[n - 2]];
  return q.slice(1);
}

console.log(hofstadterQ(20).join(" "));
