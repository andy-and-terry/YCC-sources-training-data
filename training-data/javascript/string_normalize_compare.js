const composed = "é";
const decomposed = "é";

console.log(composed === decomposed);
console.log(composed.normalize("NFC") === decomposed.normalize("NFC"));
console.log(composed.length, decomposed.length);

const stripAccents = (s) => s.normalize("NFD").replace(/[̀-ͯ]/g, "");
console.log(stripAccents("Crème Brûlée à la façon"));

const names = ["Zoë", "Zoe", "zoe", "Åsa", "Asa"];
console.log([...names].sort());
console.log([...names].sort((a, b) => a.localeCompare(b, "en", { sensitivity: "base" })));
console.log("a".localeCompare("B"), "a" < "B");
