/** Stable in-place partition that moves every element failing `keep` to the end. */
export function moveToEnd<T>(a: T[], keep: (x: T) => boolean): T[] {
  let write = 0;
  for (let read = 0; read < a.length; read++) {
    if (keep(a[read])) {
      [a[write], a[read]] = [a[read], a[write]];
      write++;
    }
  }
  return a;
}

console.log(moveToEnd([0, 1, 0, 3, 12, 0, 7], (x) => x !== 0));
console.log(moveToEnd(["a", "", "b", "", "c"], Boolean));
