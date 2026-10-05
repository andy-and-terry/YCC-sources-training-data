const amount = 1234567.891;

console.log(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(amount));
console.log(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(amount));
console.log(new Intl.NumberFormat("en", { notation: "compact" }).format(amount));

const date = new Date(Date.UTC(2024, 4, 17, 12, 0));
console.log(new Intl.DateTimeFormat("en-US", { dateStyle: "long", timeZone: "UTC" }).format(date));

const rtf = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
console.log(rtf.format(-1, "day"), "/", rtf.format(3, "week"));

const list = new Intl.ListFormat("en", { style: "long", type: "conjunction" });
console.log(list.format(["red", "green", "blue"]));

const plural = new Intl.PluralRules("en", { type: "ordinal" });
console.log(plural.select(1), plural.select(2), plural.select(4));
