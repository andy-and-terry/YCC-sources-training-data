function isbn10Valid(raw) {
  const s = raw.replace(/-/g, "");
  if (!/^\d{9}[\dXx]$/.test(s)) return false;
  let total = 0;
  for (let i = 0; i < 9; i++) total += (10 - i) * Number(s[i]);
  total += /[Xx]/.test(s[9]) ? 10 : Number(s[9]);
  return total % 11 === 0;
}

function isbn13Valid(raw) {
  const s = raw.replace(/-/g, "");
  if (!/^\d{13}$/.test(s)) return false;
  let total = 0;
  for (let i = 0; i < 13; i++) total += Number(s[i]) * (i % 2 === 0 ? 1 : 3);
  return total % 10 === 0;
}

function isbn10To13(raw) {
  const core = "978" + raw.replace(/-/g, "").slice(0, 9);
  let total = 0;
  for (let i = 0; i < 12; i++) total += Number(core[i]) * (i % 2 === 0 ? 1 : 3);
  return core + ((10 - (total % 10)) % 10);
}

console.log(isbn10Valid("0-306-40615-2"), isbn10Valid("0-306-40615-3"));
console.log(isbn13Valid("978-0-306-40615-7"), isbn10To13("0-306-40615-2"));
module.exports = { isbn10Valid, isbn13Valid, isbn10To13 };
