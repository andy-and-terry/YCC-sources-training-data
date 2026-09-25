const MORSE: Readonly<Record<string, string>> = {
  A: ".-", B: "-...", C: "-.-.", D: "-..", E: ".", F: "..-.", G: "--.", H: "....",
  I: "..", J: ".---", K: "-.-", L: ".-..", M: "--", N: "-.", O: "---", P: ".--.",
  Q: "--.-", R: ".-.", S: "...", T: "-", U: "..-", V: "...-", W: ".--", X: "-..-",
  Y: "-.--", Z: "--..", "0": "-----", "1": ".----", "2": "..---", "3": "...--",
  "4": "....-", "5": ".....", "6": "-....", "7": "--...", "8": "---..", "9": "----.",
};
const REVERSE = new Map(Object.entries(MORSE).map(([k, v]) => [v, k] as const));

export const encode = (text: string): string =>
  text
    .toUpperCase()
    .split(/\s+/)
    .map((w) => [...w].flatMap((c) => (MORSE[c] ? [MORSE[c]] : [])).join(" "))
    .join(" / ");

export const decode = (code: string): string =>
  code.split(" / ").map((w) => w.split(" ").map((s) => REVERSE.get(s) ?? "?").join("")).join(" ");

const m = encode("SOS help 2024");
console.log(m);
console.log(decode(m));
