const abbreviate = (phrase) =>
  (phrase.replace(/-/g, " ").match(/[A-Za-z][A-Za-z']*/g) || []).map((w) => w[0].toUpperCase()).join("");

console.log(abbreviate("Portable Network Graphics"));
console.log(abbreviate("Complementary metal-oxide semiconductor"));
