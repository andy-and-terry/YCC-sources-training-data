const Level = { Low: 1, Mid: 2, High: 3 } as const;
type Level = (typeof Level)[keyof typeof Level];

function label(l: Level): string {
  return Object.entries(Level).find(([, v]) => v === l)![0];
}

console.log(label(Level.Mid));
