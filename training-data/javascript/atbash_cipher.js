function atbash(text) {
  return text.replace(/[a-z]/gi, (ch) => {
    const base = ch <= "Z" ? 65 : 97;
    return String.fromCharCode(base + 25 - (ch.charCodeAt(0) - base));
  });
}

const enc = atbash("Hello, World!");
console.log(enc, "|", atbash(enc));
module.exports = { atbash };
