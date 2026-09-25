function shift(text, key, sign) {
  let k = 0;
  return text.replace(/[a-z]/gi, (ch) => {
    const base = ch <= "Z" ? 65 : 97;
    const s = key.toLowerCase().charCodeAt(k++ % key.length) - 97;
    return String.fromCharCode(((ch.charCodeAt(0) - base + sign * s + 26) % 26) + base);
  });
}

const encrypt = (t, k) => shift(t, k, 1);
const decrypt = (t, k) => shift(t, k, -1);

const c = encrypt("Attack at dawn!", "LEMON");
console.log(c, "->", decrypt(c, "LEMON"));
module.exports = { encrypt, decrypt };
