const config = { server: { port: 0, host: null } };
console.log(config.server.port || 8080);
console.log(config.server.port ?? 8080);
console.log(config.server.host?.toUpperCase() ?? "localhost");
console.log(config.db?.url ?? "no db");
let cache = {};
cache.hits ??= 0;
cache.hits++;
console.log(cache);
