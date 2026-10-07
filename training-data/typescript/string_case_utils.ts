function words(s: string): string[] {
  return s
    .replace(/([a-z0-9])([A-Z])/g, "$1 $2")
    .split(/[\s_\-]+/)
    .filter(Boolean)
    .map((w) => w.toLowerCase());
}

const cap = (w: string): string => w.charAt(0).toUpperCase() + w.slice(1);

const camelCase = (s: string): string =>
  words(s).map((w, i) => (i === 0 ? w : cap(w))).join("");
const pascalCase = (s: string): string => words(s).map(cap).join("");
const snakeCase = (s: string): string => words(s).join("_");
const kebabCase = (s: string): string => words(s).join("-");
const titleCase = (s: string): string => words(s).map(cap).join(" ");

const samples = ["hello world", "someVariableName", "already_snake_case", "Kebab-Case-Input"];
for (const s of samples) {
  console.log(
    [camelCase(s), pascalCase(s), snakeCase(s), kebabCase(s), titleCase(s)].join(" | ")
  );
}
