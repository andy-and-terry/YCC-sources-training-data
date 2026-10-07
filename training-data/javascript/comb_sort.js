// Like bubble sort, but starts comparing elements far apart (gap shrinking
// by 1.3x each pass) to quickly move small "turtle" values out of the
// tail, which plain bubble sort handles poorly.
function combSort(arr) {
  const result = [...arr];
  let gap = result.length;
  let swapped = true;
  const shrink = 1.3;

  while (gap > 1 || swapped) {
    gap = Math.floor(gap / shrink);
    if (gap < 1) gap = 1;
    swapped = false;

    for (let i = 0; i + gap < result.length; i++) {
      if (result[i] > result[i + gap]) {
        [result[i], result[i + gap]] = [result[i + gap], result[i]];
        swapped = true;
      }
    }
  }
  return result;
}

console.log(combSort([8, 4, 1, 56, 3, 44, 23, 0]));
module.exports = { combSort };
