const MORSE = {
  A: ".-", B: "-...", C: "-.-.", D: "-..", E: ".", F: "..-.", G: "--.", H: "....",
  I: "..", J: ".---", K: "-.-", L: ".-..", M: "--", N: "-.", O: "---", P: ".--.",
  Q: "--.-", R: ".-.", S: "...", T: "-", U: "..-", V: "...-", W: ".--", X: "-..-",
  Y: "-.--", Z: "--..", 0: "-----", 1: ".----", 2: "..---", 3: "...--", 4: "....-",
  5: ".....", 6: "-....", 7: "--...", 8: "---..", 9: "----.",
};
const REVERSE = Object.fromEntries(Object.entries(MORSE).map(([k, v]) => [v, k]));

const encode = (text) =>
  text.toUpperCase().split(/\s+/).map((w) => [...w].filter((c) => MORSE[c]).map((c) => MORSE[c]).join(" ")).join(" / ");

const decode = (code) => code.split(" / ").map((w) => w.split(" ").map((s) => REVERSE[s]).join("")).join(" ");

const m = encode("SOS help 2024");
console.log(m);
console.log(decode(m));
module.exports = { encode, decode };
