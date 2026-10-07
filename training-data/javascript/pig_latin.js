function translateWord(word) {
  if (/^([aeiou]|xr|yt)/.test(word)) return word + "ay";
  const m = word.match(/^([^aeiou]*qu|[^aeiou]+?(?=y)|[^aeiou]+)(.*)$/);
  return m ? m[2] + m[1] + "ay" : word + "ay";
}

const translate = (s) => s.toLowerCase().split(/\s+/).map(translateWord).join(" ");

console.log(translate("quick fast run apple rhythm square"));
