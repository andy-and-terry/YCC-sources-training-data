type DeepReadonly<T> = { readonly [K in keyof T]: T[K] extends object ? DeepReadonly<T[K]> : T[K] };

interface Config {
  db: { host: string; port: number };
  debug: boolean;
}

const cfg: DeepReadonly<Config> = { db: { host: "h", port: 1 }, debug: false };
// cfg.db.port = 2; // error: read-only
console.log(cfg.db.port);
