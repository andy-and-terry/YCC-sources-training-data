const flip = (c) => (/[a-z]/.test(c) ? String.fromCharCode(219 - c.charCodeAt(0)) : c);

function encode(text) {
  const cleaned = text.toLowerCase().replace(/[^a-z0-9]/g, "").split("").map(flip).join("");
  return cleaned.match(/.{1,5}/g)?.join(" ") ?? "";
}

const decode = (text) => text.replace(/ /g, "").split("").map(flip).join("");

const e = encode("The quick brown fox");
console.log(e, "->", decode(e));
