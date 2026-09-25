function combSort(items) {
  const a = [...items];
  let gap = a.length;
  let sorted = false;
  while (!sorted) {
    gap = Math.floor(gap / 1.3);
    if (gap <= 1) {
      gap = 1;
      sorted = true;
    }
    for (let i = 0; i + gap < a.length; i++) {
      if (a[i] > a[i + gap]) {
        [a[i], a[i + gap]] = [a[i + gap], a[i]];
        sorted = false;
      }
    }
  }
  return a;
}

console.log(combSort([8, 4, 1, 56, 3, -44, 23, -6, 28, 0]));
module.exports = { combSort };
