type CaseStyle = "camel" | "pascal" | "snake" | "kebab" | "constant";

export function splitWords(s: string): string[] {
  return s
    .replace(/([a-z0-9])([A-Z])/g, "$1 $2")
    .replace(/([A-Z]+)([A-Z][a-z])/g, "$1 $2")
    .split(/[\s_\-]+/)
    .filter(Boolean)
    .map((w) => w.toLowerCase());
}

const cap = (w: string): string => w.charAt(0).toUpperCase() + w.slice(1);

export function convertCase(s: string, style: CaseStyle): string {
  const w = splitWords(s);
  switch (style) {
    case "camel": return w.map((x, i) => (i ? cap(x) : x)).join("");
    case "pascal": return w.map(cap).join("");
    case "snake": return w.join("_");
    case "kebab": return w.join("-");
    case "constant": return w.join("_").toUpperCase();
  }
}

const styles: CaseStyle[] = ["camel", "pascal", "snake", "kebab", "constant"];
for (const input of ["parseHTTPResponse", "user_id", "background-color"]) {
  console.log(input, "=>", styles.map((s) => convertCase(input, s)).join(", "));
}
