// Intl.Segmenter splits text by grapheme, word or sentence according to
// Unicode rules, which string.length and split("") get wrong for emoji.
const text = "Hi 👨‍👩‍👧 café!";

const graphemes = [...new Intl.Segmenter("en", { granularity: "grapheme" }).segment(text)]
  .map((s) => s.segment);
console.log("code units:", text.length);
console.log("graphemes:", graphemes.length);
console.log(graphemes);

const sentence = "Segmenting words isn't hard. Really!";
const words = [...new Intl.Segmenter("en", { granularity: "word" }).segment(sentence)]
  .filter((s) => s.isWordLike)
  .map((s) => s.segment);
console.log(words);

const sentences = [...new Intl.Segmenter("en", { granularity: "sentence" }).segment(sentence)]
  .map((s) => s.segment.trim());
console.log(sentences);

function truncateGraphemes(str, max) {
  const parts = [...new Intl.Segmenter().segment(str)].map((s) => s.segment);
  return parts.length <= max ? str : parts.slice(0, max).join("") + "…";
}
console.log(truncateGraphemes("👍🏽👍🏽👍🏽👍🏽", 2));
