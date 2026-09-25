function pigWord(word) {
  const i = word.search(/[aeiou]/i);
  if (i === 0) return word + "way";
  if (i < 0) return word + "ay";
  return word.slice(i) + word.slice(0, i) + "ay";
}

const pigLatin = (sentence) => sentence.split(/\s+/).map(pigWord).join(" ");

console.log(pigLatin("the quick brown fox jumps over the lazy dog"));
module.exports = { pigLatin };
