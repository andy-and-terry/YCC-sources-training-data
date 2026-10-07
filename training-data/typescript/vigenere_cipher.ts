type Direction = 1 | -1;

function shift(text: string, key: string, dir: Direction): string {
  const k = key.toLowerCase().replace(/[^a-z]/g, "");
  if (!k) throw new Error("key must contain letters");
  let i = 0;
  return text.replace(/[a-z]/gi, (ch) => {
    const base = ch <= "Z" ? 65 : 97;
    const s = k.charCodeAt(i++ % k.length) - 97;
    return String.fromCharCode(((ch.charCodeAt(0) - base + dir * s + 26) % 26) + base);
  });
}

export const encrypt = (t: string, k: string): string => shift(t, k, 1);
export const decrypt = (t: string, k: string): string => shift(t, k, -1);

const c = encrypt("Attack at dawn!", "LEMON");
console.log(c, "->", decrypt(c, "LEMON"));
