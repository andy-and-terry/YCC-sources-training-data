const cfg = { server: { port: 0 } };
console.log(cfg.server?.port ?? 8080);
console.log(cfg.db?.host ?? "localhost");
console.log(cfg.list?.[0]);
console.log(cfg.run?.());
