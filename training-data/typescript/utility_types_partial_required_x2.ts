interface Opts { host: string; port?: number }
const defaults: Required<Opts> = { host: "h", port: 80 };
const override: Partial<Opts> = { port: 8080 };
console.log({ ...defaults, ...override });
