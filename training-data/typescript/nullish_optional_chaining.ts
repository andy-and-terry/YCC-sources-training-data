interface Settings {
  theme?: { color?: string; fontSize?: number };
  retries?: number;
  onSave?: (name: string) => string;
  tags?: string[];
}

function describe(s: Settings): string {
  const color = s.theme?.color ?? "blue";
  const size = s.theme?.fontSize ?? 12;
  const retries = s.retries ?? 3;
  const saved = s.onSave?.("doc") ?? "no handler";
  const firstTag = s.tags?.[0] ?? "untagged";
  return `${color}/${size}/${retries}/${saved}/${firstTag}`;
}

console.log(describe({}));
console.log(describe({ theme: { color: "red", fontSize: 0 }, retries: 0 }));
console.log(describe({ onSave: (n) => `saved ${n}`, tags: ["x"] }));

// || treats 0 and "" as missing, ?? only treats null/undefined as missing
const zero = 0;
console.log(zero || 10, zero ?? 10);
const empty = "";
console.log(empty || "fallback", empty ?? "fallback");

let cache: Record<string, number> | undefined;
cache ??= {};
cache.hits ??= 0;
cache.hits += 1;
console.log(cache);

let flag: boolean | null = null;
flag ||= true;
flag &&= false;
console.log(flag);
