const config = { server: { port: 0, host: null } };

console.log(config.server?.port ?? 8080);
console.log(config.server?.host ?? "localhost");
console.log(config.db?.url ?? "no db");
console.log(config.cache?.get?.("k"));
