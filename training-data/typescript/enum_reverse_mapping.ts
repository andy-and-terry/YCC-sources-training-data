enum Status {
  Pending = 1,
  Active,
  Closed = 10,
}

enum Label {
  Low = "low",
  High = "high",
}

console.log(Status.Active, Status[2], Status[10]);
console.log(Object.keys(Status).filter((k) => isNaN(Number(k))));

const numericValues = Object.values(Status).filter((v): v is Status => typeof v === "number");
console.log(numericValues);

function parseLabel(raw: string): Label | undefined {
  return (Object.values(Label) as string[]).includes(raw) ? (raw as Label) : undefined;
}
console.log(parseLabel("high"), parseLabel("mid"));
