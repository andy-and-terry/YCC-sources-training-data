const cfg = { db: { host: "localhost", opts: null } };

console.log(cfg.db?.host ?? "none");
console.log(cfg.cache?.ttl ?? 60);
console.log(cfg.db.opts?.timeout ?? "unset");
console.log(cfg.run?.());
