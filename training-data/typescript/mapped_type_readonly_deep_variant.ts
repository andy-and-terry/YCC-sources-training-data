type DeepReadonly<T> = { readonly [K in keyof T]: T[K] extends object ? DeepReadonly<T[K]> : T[K] };

interface Cfg { db: { host: string; port: number }; debug: boolean }

const cfg: DeepReadonly<Cfg> = { db: { host: "h", port: 1 }, debug: false };
// cfg.db.port = 2; // error
console.log(cfg.db.port);
