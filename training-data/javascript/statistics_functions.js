function mean(values) {
  return values.reduce((a, b) => a + b, 0) / values.length;
}

function median(values) {
  const sorted = [...values].sort((a, b) => a - b);
  const mid = Math.floor(sorted.length / 2);
  return sorted.length % 2 === 0 ? (sorted[mid - 1] + sorted[mid]) / 2 : sorted[mid];
}

function mode(values) {
  const counts = new Map();
  for (const v of values) counts.set(v, (counts.get(v) || 0) + 1);
  return [...counts.entries()].sort((a, b) => b[1] - a[1])[0][0];
}

function variance(values) {
  const m = mean(values);
  return values.reduce((acc, x) => acc + (x - m) ** 2, 0) / values.length;
}

function stdev(values) {
  return Math.sqrt(variance(values));
}

const data = [2, 4, 4, 4, 5, 5, 7, 9];
console.log(mean(data), median(data), mode(data), stdev(data).toFixed(3));
module.exports = { mean, median, mode, variance, stdev };
