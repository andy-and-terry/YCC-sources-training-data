const amount = 1234567.891;

const usd = new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" });
const german = new Intl.NumberFormat("de-DE", { maximumFractionDigits: 1 });
const compact = new Intl.NumberFormat("en", { notation: "compact" });

console.log(usd.format(amount));
console.log(german.format(amount));
console.log(compact.format(amount));

const date = new Date(Date.UTC(2024, 2, 9, 15, 30));
const dateFormat = new Intl.DateTimeFormat("en-GB", {
  dateStyle: "long",
  timeZone: "UTC",
});
console.log(dateFormat.format(date));

const plural = new Intl.PluralRules("en");
function describe(count: number, noun: string): string {
  const suffix = plural.select(count) === "one" ? "" : "s";
  return `${count} ${noun}${suffix}`;
}
console.log(describe(1, "file"), "|", describe(4, "file"));

const list = new Intl.ListFormat("en", { style: "long", type: "conjunction" });
console.log(list.format(["red", "green", "blue"]));

const names = ["zebra", "Ärger", "apple", "Banana"];
console.log([...names].sort(new Intl.Collator("en").compare));
