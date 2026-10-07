interface Scores {
  [student: string]: number;
}


const scores: Scores = { alice: 90, bob: 72 };
scores["carol"] = 85;

let total = 0;
for (const name in scores) total += scores[name];
console.log("average:", total / Object.keys(scores).length);

type Handlers = { [K in `on${Capitalize<"click" | "hover">}`]?: () => void };
const h: Handlers = { onClick: () => console.log("clicked") };
h.onClick?.();

const lookup: Record<number, string> = { 1: "one", 2: "two" };
console.log(lookup[2], lookup[3] ?? "missing");
