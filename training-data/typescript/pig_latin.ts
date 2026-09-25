function pigWord(word: string): string {
  const match = /^([^aeiou]*)(.*)$/i.exec(word)!;
  const [, consonants, rest] = match;
  if (!consonants) return word + "way";
  if (!rest) return word + "ay";
  // keep "qu" together, e.g. "quick" -> "ickquay"
  if (/q$/i.test(consonants) && /^u/i.test(rest)) return rest.slice(1) + consonants + "uay";
  return rest + consonants + "ay";
}

export const pigLatin = (sentence: string): string => sentence.split(/\s+/).map(pigWord).join(" ");

console.log(pigLatin("the quick brown fox jumps over the lazy dog"));
