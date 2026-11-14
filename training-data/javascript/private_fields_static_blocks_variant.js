class Registry {
  static #items = new Map();
  static {
    Registry.#items.set("default", 0);
  }
  static bump(key) {
    Registry.#items.set(key, (Registry.#items.get(key) ?? 0) + 1);
    return Registry.#items.get(key);
  }
}

console.log(Registry.bump("a"), Registry.bump("a"), Registry.bump("default"));
