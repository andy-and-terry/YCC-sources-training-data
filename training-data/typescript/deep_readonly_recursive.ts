type DeepReadonly<T> = { readonly [K in keyof T]: T[K] extends object ? DeepReadonly<T[K]> : T[K] };
const cfg: DeepReadonly<{ a: { b: number[] } }> = { a: { b: [1] } };
console.log(cfg.a.b);
