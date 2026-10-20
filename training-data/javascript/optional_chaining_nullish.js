// Optional chaining (?.) and nullish coalescing (??) versus || for falsy values.
const config = { server: { port: 0, host: null }, tags: [] };

console.log(config.server?.port ?? 8080);   // 0 (kept: only null/undefined fall through)
console.log(config.server?.port || 8080);   // 8080 (0 is falsy)
console.log(config.server?.host ?? "localhost");
console.log(config.db?.url ?? "no db");
console.log(config.tags?.[0]?.name);        // undefined
