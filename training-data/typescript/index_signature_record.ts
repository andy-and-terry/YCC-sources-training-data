interface Dictionary<T> {
  [key: string]: T;
}

const ages: Dictionary<number> = { alice: 30, bob: 25 };
ages["carol"] = 41;

type Status = "pending" | "active" | "done";
const labels: Record<Status, string> = {
  pending: "Waiting",
  active: "In progress",
  done: "Finished",
};

function countBy<T>(items: T[], keyFn: (item: T) => string): Record<string, number> {
  const counts: Record<string, number> = {};
  for (const item of items) {
    const key = keyFn(item);
    counts[key] = (counts[key] ?? 0) + 1;
  }
  return counts;
}

interface HttpHeaders {
  "content-type": string;
  [extra: string]: string;
}

const headers: HttpHeaders = { "content-type": "text/plain", "x-id": "42" };

console.log(Object.keys(ages), ages.alice);
console.log(labels.active);
console.log(countBy(["apple", "avocado", "banana"], (w) => w[0]));
console.log(headers["x-id"]);
console.log("bob" in ages, Object.hasOwn(ages, "zed"));
