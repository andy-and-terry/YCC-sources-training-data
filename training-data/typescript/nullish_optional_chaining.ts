interface Config {
  server?: {
    port?: number;
    host?: string;
    tls?: { enabled: boolean };
  };
  retries?: number;
}

const a: Config = {};
const b: Config = { server: { port: 0, tls: { enabled: false } }, retries: 0 };

for (const cfg of [a, b]) {
  const port = cfg.server?.port ?? 8080;       // 0 is kept, undefined falls back
  const portOr = cfg.server?.port || 8080;     // || also replaces 0
  const tls = cfg.server?.tls?.enabled ?? true;
  console.log({ port, portOr, tls, retries: cfg.retries ?? 3 });
}

let counter: number | undefined;
counter ??= 10;
counter ||= 20;
console.log(counter);

const fn = (Math.random() > 2 ? () => "called" : undefined) as (() => string) | undefined;
console.log(fn?.() ?? "no function");
