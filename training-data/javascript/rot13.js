const rot13 = (s) =>
  s.replace(/[a-z]/gi, (c) => {
    const base = c <= "Z" ? 65 : 97;
    return String.fromCharCode(((c.charCodeAt(0) - base + 13) % 26) + base);
  });

const text = "Why did the chicken cross the road?";
console.log(rot13(text));
console.log(rot13(rot13(text)) === text);
module.exports = { rot13 };
