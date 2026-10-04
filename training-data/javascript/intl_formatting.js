const n = 1234567.891;

console.log(new Intl.NumberFormat("en-US").format(n));
console.log(new Intl.NumberFormat("de-DE").format(n));
console.log(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(n));
console.log(new Intl.NumberFormat("en-US", { style: "percent", maximumFractionDigits: 1 }).format(0.4567));
console.log(new Intl.NumberFormat("en", { notation: "compact" }).format(n));
console.log(new Intl.NumberFormat("en", { style: "unit", unit: "kilometer-per-hour" }).format(88));

const d = new Date(Date.UTC(2024, 6, 4, 15, 30));
const opts = { timeZone: "UTC", dateStyle: "long", timeStyle: "short" };
console.log(new Intl.DateTimeFormat("en-US", opts).format(d));
console.log(new Intl.DateTimeFormat("fr-FR", opts).format(d));

const rtf = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
console.log(rtf.format(-1, "day"), "|", rtf.format(3, "week"));

const list = new Intl.ListFormat("en", { style: "long", type: "conjunction" });
console.log(list.format(["red", "green", "blue"]));

const plural = new Intl.PluralRules("en", { type: "ordinal" });
const suffix = { one: "st", two: "nd", few: "rd", other: "th" };
console.log([1, 2, 3, 4, 11, 22].map((x) => x + suffix[plural.select(x)]).join(" "));
