const record = {
  name: "Report",
  secret: "hunter2",
  created: new Date(Date.UTC(2024, 0, 15, 12)),
  tags: new Set(["x", "y"]),
  size: 10n,
  nested: { secret: "inner", keep: 1 },
};

const json = JSON.stringify(
  record,
  (key, value) => {
    if (key === "secret") return undefined;
    if (value instanceof Set) return { __type: "Set", values: [...value] };
    if (typeof value === "bigint") return { __type: "BigInt", value: value.toString() };
    return value;
  },
  2
);
console.log(json);

const revived = JSON.parse(json, (key, value) => {
  if (value && value.__type === "Set") return new Set(value.values);
  if (value && value.__type === "BigInt") return BigInt(value.value);
  if (key === "created") return new Date(value);
  return value;
});
console.log(revived.created.getUTCFullYear(), revived.tags.has("x"), revived.size + 1n);

console.log(JSON.stringify(record.nested, ["keep"]));
console.log(JSON.stringify({ toJSON() { return "custom"; } }));
