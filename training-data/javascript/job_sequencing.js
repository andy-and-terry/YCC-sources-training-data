function scheduleJobs(jobs) {
  const sorted = [...jobs].sort((a, b) => b.profit - a.profit);
  const maxD = Math.max(...jobs.map((j) => j.deadline));
  const slots = new Array(maxD + 1).fill(null);
  for (const job of sorted) {
    for (let t = job.deadline; t > 0; t--) {
      if (!slots[t]) {
        slots[t] = job;
        break;
      }
    }
  }
  const chosen = slots.filter(Boolean);
  return { order: chosen.map((j) => j.id), profit: chosen.reduce((s, j) => s + j.profit, 0) };
}

console.log(scheduleJobs([
  { id: "a", deadline: 2, profit: 100 },
  { id: "b", deadline: 1, profit: 19 },
  { id: "c", deadline: 2, profit: 27 },
  { id: "d", deadline: 1, profit: 25 },
  { id: "e", deadline: 3, profit: 15 },
]));
module.exports = { scheduleJobs };
