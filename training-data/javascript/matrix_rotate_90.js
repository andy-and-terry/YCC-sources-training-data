function rotateClockwise(m) {
  const n = m.length;
  for (let i = 0; i < n; i++)
    for (let j = i + 1; j < n; j++) [m[i][j], m[j][i]] = [m[j][i], m[i][j]];
  m.forEach((row) => row.reverse());
  return m;
}

console.log(rotateClockwise([[1, 2, 3], [4, 5, 6], [7, 8, 9]]));
