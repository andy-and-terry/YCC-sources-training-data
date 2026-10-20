class Config {
  static defaults;
  static {
    Config.defaults = Object.freeze({ mode: "dev", port: 3000 });
  }
}
console.log(Config.defaults);
