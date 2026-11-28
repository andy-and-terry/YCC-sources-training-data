function fletcher16(data: number[]): number {
  let s1 = 0;
  let s2 = 0;
  for (const b of data) {
    s1 = (s1 + b) % 255;
    s2 = (s2 + s1) % 255;
  }
  return (s2 << 8) | s1;
}

const bytes = Array.from("abcde", (c) => c.charCodeAt(0));
console.log(fletcher16(bytes).toString(16)); // c8f0
