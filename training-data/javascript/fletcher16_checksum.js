function fletcher16(bytes) {
  let s1 = 0, s2 = 0;
  for (const b of bytes) {
    s1 = (s1 + b) % 255;
    s2 = (s2 + s1) % 255;
  }
  return (s2 << 8) | s1;
}

console.log(fletcher16(Buffer.from("abcde")).toString(16)); // c8f0
