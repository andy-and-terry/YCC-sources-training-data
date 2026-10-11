const events = [
  { id: 1, type: "login", ok: true },
  { id: 2, type: "error", ok: false },
  { id: 3, type: "login", ok: true },
  { id: 4, type: "error", ok: false },
];

console.log(events.find((e) => e.type === "error").id);
console.log(events.findLast((e) => e.type === "error").id);
console.log(events.findIndex((e) => e.type === "login"));
console.log(events.findLastIndex((e) => e.type === "login"));
console.log(events.some((e) => !e.ok), events.every((e) => e.id > 0));
console.log(events.at(-1).id, [1, 2, 3].includes(2), [NaN].includes(NaN), [NaN].indexOf(NaN));
