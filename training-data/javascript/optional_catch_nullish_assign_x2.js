let cfg = { retries: 0, name: null };
cfg.retries ||= 3;
cfg.name ??= "default";
cfg.extra &&= 1;
console.log(cfg);
