const enum Level { Debug, Info, Warn }
const names: Record<Level, string> = { [Level.Debug]: "D", [Level.Info]: "I", [Level.Warn]: "W" };
console.log(names[Level.Warn]);
