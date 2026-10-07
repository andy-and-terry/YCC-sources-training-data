interface Settings {
  theme?: { color?: string; fontSize?: number };
  retries?: number;
  tags?: string[];
  onSave?: (id: number) => string;
}

const empty: Settings = {};
const full: Settings = {
  theme: { color: "blue", fontSize: 0 },
  retries: 0,
  tags: ["a"],
  onSave: (id) => `saved ${id}`,
};

for (const s of [empty, full]) {
  console.log(s.theme?.color ?? "default-color");
  console.log(s.theme?.fontSize ?? 14);
  console.log(s.retries || 3, s.retries ?? 3);
  console.log(s.tags?.[0] ?? "no tags");
  console.log(s.onSave?.(7) ?? "no handler");
}

let cache: Record<string, number> | undefined;
cache ??= {};
cache["hits"] ??= 0;
cache["hits"] += 1;
console.log(cache);
