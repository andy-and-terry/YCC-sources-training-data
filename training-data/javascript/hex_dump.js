function hexDump(buf, width = 16) {
  const lines = [];
  for (let off = 0; off < buf.length; off += width) {
    const chunk = buf.subarray(off, off + width);
    const hex = [...chunk].map((b) => b.toString(16).padStart(2, "0")).join(" ");
    const text = [...chunk].map((b) => (b >= 32 && b < 127 ? String.fromCharCode(b) : ".")).join("");
    lines.push(`${off.toString(16).padStart(8, "0")}  ${hex.padEnd(width * 3 - 1)}  ${text}`);
  }
  return lines.join("\n");
}

console.log(hexDump(Buffer.from("Hello, JavaScript!\n\tBinary: \x00\x01\xff")));
