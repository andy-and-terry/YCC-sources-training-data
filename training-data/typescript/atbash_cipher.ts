const flip = (c: string): string =>
  c >= "a" && c <= "z" ? String.fromCharCode(219 - c.charCodeAt(0)) : c;

export function encode(text: string): string {
  const out = [...text.toLowerCase().replace(/[^a-z0-9]/g, "")].map(flip).join("");
  return (out.match(/.{1,5}/g) ?? []).join(" ");
}

export const decode = (text: string): string => [...text.replace(/ /g, "")].map(flip).join("");

const enc = encode("Testing, 1 2 3, testing.");
console.log(enc, "|", decode(enc));
