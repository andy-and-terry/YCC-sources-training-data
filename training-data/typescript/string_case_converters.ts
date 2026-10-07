function words(input: string): string[] {
  return input
    .replace(/([a-z0-9])([A-Z])/g, "$1 $2")
    .replace(/[_\-]+/g, " ")
    .trim()
    .split(/\s+/)
    .filter(Boolean)
    .map((w) => w.toLowerCase());
}

const capitalize = (w: string): string => w.charAt(0).toUpperCase() + w.slice(1);

export const toCamel = (s: string): string =>
  words(s).map((w, i) => (i === 0 ? w : capitalize(w))).join("");
export const toPascal = (s: string): string => words(s).map(capitalize).join("");
export const toSnake = (s: string): string => words(s).join("_");
export const toKebab = (s: string): string => words(s).join("-");

for (const input of ["hello_world_example", "HelloWorldExample", "some-kebab-case", "XMLHttp request"]) {
  console.log(input, "->", toCamel(input), toPascal(input), toSnake(input), toKebab(input));
}
