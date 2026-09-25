function isValidIsbn10(isbn) {
  const chars = isbn.replace(/-/g, "");
  if (!/^\d{9}[\dX]$/.test(chars)) return false;
  let total = 0;
  for (let i = 0; i < 10; i++) {
    const v = chars[i] === "X" ? 10 : Number(chars[i]);
    total += v * (10 - i);
  }
  return total % 11 === 0;
}

["3-598-21508-8", "3-598-21507-X", "3-598-21508-9"].forEach((s) => console.log(s, isValidIsbn10(s)));
