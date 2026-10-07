const VOWEL = /^([aeiou]|xr|yt)/;
const CONSONANT = /^([^aeiou]*qu|[^aeiou]+?(?=y)|[^aeiou]+)(.*)$/;

export function translateWord(word: string): string {
  if (VOWEL.test(word)) return `${word}ay`;
  const m = CONSONANT.exec(word);
  return m ? `${m[2]}${m[1]}ay` : `${word}ay`;
}

export const translate = (s: string): string => s.toLowerCase().split(/\s+/).map(translateWord).join(" ");

console.log(translate("quiet yellow xray chair my"));
