class Container {
  constructor() { this.f = new Map(); this.cache = new Map(); }
  register(name, factory) { this.f.set(name, factory); }
  resolve(name) {
    if (!this.cache.has(name)) this.cache.set(name, this.f.get(name)(this));
    return this.cache.get(name);
  }
}
const c = new Container();
c.register("db", () => ({ q: () => "rows" }));
c.register("repo", (c) => ({ all: () => c.resolve("db").q() }));
console.log(c.resolve("repo").all());
