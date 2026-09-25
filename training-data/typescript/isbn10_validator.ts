export function isValidIsbn10(isbn: string): boolean {
  const chars = isbn.replace(/-/g, "");
  if (!/^\d{9}[\dX]$/.test(chars)) return false;
  const total = [...chars].reduce((acc, ch, i) => acc + (ch === "X" ? 10 : Number(ch)) * (10 - i), 0);
  return total % 11 === 0;
}

for (const s of ["3-598-21508-8", "3-598-21507-X", "3-598-21508-9"]) console.log(s, isValidIsbn10(s));
