const n = 1234567.891;
console.log(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(n));
console.log(new Intl.NumberFormat("de-DE").format(n));
console.log(new Intl.PluralRules("en").select(1), new Intl.PluralRules("en").select(5));
