const cfg = { server: { port: 0 } };
console.log(cfg.db?.host, cfg.server?.port ?? 8080, cfg.server.port || 8080);
cfg.name ??= 'default';
cfg.server.port ||= 3000;
console.log(cfg);
