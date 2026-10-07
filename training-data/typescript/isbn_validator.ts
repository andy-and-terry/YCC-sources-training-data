type IsbnResult = { ok: true; kind: "ISBN-10" | "ISBN-13" } | { ok: false; reason: string };

export function validateIsbn(raw: string): IsbnResult {
  const s = raw.replace(/[-\s]/g, "");
  if (s.length === 10) {
    if (!/^\d{9}[\dX]$/i.test(s)) return { ok: false, reason: "bad characters" };
    let total = 0;
    for (let i = 0; i < 10; i++) total += (10 - i) * (/x/i.test(s[i]) ? 10 : Number(s[i]));
    return total % 11 === 0 ? { ok: true, kind: "ISBN-10" } : { ok: false, reason: "checksum" };
  }
  if (s.length === 13) {
    if (!/^\d{13}$/.test(s)) return { ok: false, reason: "bad characters" };
    let total = 0;
    for (let i = 0; i < 13; i++) total += Number(s[i]) * (i % 2 ? 3 : 1);
    return total % 10 === 0 ? { ok: true, kind: "ISBN-13" } : { ok: false, reason: "checksum" };
  }
  return { ok: false, reason: `length ${s.length}` };
}

for (const isbn of ["0-306-40615-2", "0-306-40615-3", "978-0-306-40615-7", "12345"]) {
  console.log(isbn, validateIsbn(isbn));
}
