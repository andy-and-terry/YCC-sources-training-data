function isIsogram(word) {
  const letters = word.toLowerCase().replace(/[^a-z]/g, "");
  return new Set(letters).size === letters.length;
}

["lumberjacks", "background", "six-year-old", "isograms"].forEach((w) => console.log(w, isIsogram(w)));
