const config = {
  port: 8080,
  host: "localhost",
} satisfies Record<string, string | number>;

const pair: readonly [string, number] = ["a", 1];
console.log(config.port.toFixed(0), pair[0]);
