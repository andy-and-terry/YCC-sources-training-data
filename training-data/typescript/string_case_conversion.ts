function words(s: string): string[] {
  return s
    .replace(/([a-z0-9])([A-Z])/g, "$1 $2")
    .split(/[^A-Za-z0-9]+/)
    .filter(Boolean)
    .map((w) => w.toLowerCase());
}

const capitalize = (w: string): string => w.charAt(0).toUpperCase() + w.slice(1);

const camelCase = (s: string): string =>
  words(s).map((w, i) => (i === 0 ? w : capitalize(w))).join("");
const pascalCase = (s: string): string => words(s).map(capitalize).join("");
const snakeCase = (s: string): string => words(s).join("_");
const kebabCase = (s: string): string => words(s).join("-");

for (const input of ["hello world", "someVariableName", "already-kebab_and snake"]) {
  console.log(camelCase(input), pascalCase(input), snakeCase(input), kebabCase(input));
}
