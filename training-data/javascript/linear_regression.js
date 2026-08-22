function fit(xs, ys) {
  const n = xs.length;
  const meanX = xs.reduce((a, b) => a + b, 0) / n;
  const meanY = ys.reduce((a, b) => a + b, 0) / n;
  let numerator = 0;
  let denominator = 0;
  for (let i = 0; i < n; i++) {
    numerator += (xs[i] - meanX) * (ys[i] - meanY);
    denominator += (xs[i] - meanX) ** 2;
  }
  const slope = numerator / denominator;
  const intercept = meanY - slope * meanX;
  return { slope, intercept };
}

function predict(slope, intercept, x) {
  return slope * x + intercept;
}

const xs = [1, 2, 3, 4, 5];
const ys = [2, 4, 5, 4, 5];
const { slope, intercept } = fit(xs, ys);
console.log(`y = ${slope.toFixed(2)}x + ${intercept.toFixed(2)}`);
console.log(predict(slope, intercept, 6));
module.exports = { fit, predict };
