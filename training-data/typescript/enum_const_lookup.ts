const enum Level { Debug, Info, Warn }
const names: Record<Level, string> = {
  [Level.Debug]: "debug",
  [Level.Info]: "info",
  [Level.Warn]: "warn",
};
console.log(names[Level.Warn]);
