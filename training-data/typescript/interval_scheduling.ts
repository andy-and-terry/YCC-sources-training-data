export interface Job { name: string; start: number; end: number; weight: number }

/** Weighted interval scheduling via DP + binary search. */
export function weightedSchedule(jobs: readonly Job[]): { total: number; chosen: string[] } {
  const js = [...jobs].sort((a, b) => a.end - b.end);
  const n = js.length;
  const prevCompatible = js.map((job, i) => {
    let lo = 0, hi = i - 1, ans = -1;
    while (lo <= hi) {
      const mid = (lo + hi) >> 1;
      if (js[mid].end <= job.start) { ans = mid; lo = mid + 1; }
      else hi = mid - 1;
    }
    return ans;
  });
  const dp = new Array<number>(n + 1).fill(0);
  for (let i = 1; i <= n; i++) dp[i] = Math.max(dp[i - 1], js[i - 1].weight + dp[prevCompatible[i - 1] + 1]);
  const chosen: string[] = [];
  for (let i = n; i > 0; ) {
    if (js[i - 1].weight + dp[prevCompatible[i - 1] + 1] >= dp[i - 1]) {
      chosen.unshift(js[i - 1].name);
      i = prevCompatible[i - 1] + 1;
    } else i--;
  }
  return { total: dp[n], chosen };
}

console.log(weightedSchedule([
  { name: "A", start: 1, end: 3, weight: 5 },
  { name: "B", start: 2, end: 5, weight: 6 },
  { name: "C", start: 4, end: 6, weight: 5 },
  { name: "D", start: 6, end: 7, weight: 4 },
  { name: "E", start: 5, end: 8, weight: 11 },
  { name: "F", start: 7, end: 9, weight: 2 },
]));
