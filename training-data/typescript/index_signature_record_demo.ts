interface StringMap {
  [key: string]: string;
}

interface Scores {
  total: number;
  [subject: string]: number;
}

const headers: StringMap = { "content-type": "text/plain", accept: "*/*" };
headers["x-token"] = "abc";
console.log(Object.keys(headers));

const scores: Scores = { total: 0, math: 90, art: 75 };
scores.total = Object.entries(scores)
  .filter(([k]) => k !== "total")
  .reduce((s, [, v]) => s + v, 0);
console.log(scores);

type Level = "low" | "mid" | "high";
const thresholds: Record<Level, number> = { low: 10, mid: 50, high: 90 };

const lookup: { [K in Level as `${K}Limit`]: number } = {
  lowLimit: thresholds.low,
  midLimit: thresholds.mid,
  highLimit: thresholds.high,
};
console.log(lookup);

const counts = new Map<string, number>();
for (const ch of "mississippi") counts.set(ch, (counts.get(ch) ?? 0) + 1);
console.log(Object.fromEntries(counts));
