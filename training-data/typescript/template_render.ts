type Ctx = { [key: string]: unknown };
type Filter = (s: string) => string;

const FILTERS: Record<string, Filter> = {
  upper: (s) => s.toUpperCase(),
  lower: (s) => s.toLowerCase(),
  title: (s) => s.replace(/\b\w/g, (c) => c.toUpperCase()),
  trim: (s) => s.trim(),
};

function lookup(ctx: Ctx, path: string): unknown {
  return path.split(".").reduce<unknown>((obj, key) => (obj && typeof obj === "object" ? (obj as Ctx)[key] : undefined), ctx);
}

export function render(template: string, ctx: Ctx): string {
  return template.replace(/\{\{\s*([\w.]+)\s*((?:\|\s*\w+\s*)*)\}\}/g, (_, path: string, filters: string) => {
    let value = String(lookup(ctx, path) ?? "");
    for (const name of filters.split("|").map((f) => f.trim()).filter(Boolean)) {
      const f = FILTERS[name];
      if (!f) throw new Error(`unknown filter ${name}`);
      value = f(value);
    }
    return value;
  });
}

console.log(render("Hello {{ user.name | trim | title }}, you have {{count}} new {{ kind|upper }}.", {
  user: { name: "  ada lovelace " },
  count: 3,
  kind: "messages",
}));
