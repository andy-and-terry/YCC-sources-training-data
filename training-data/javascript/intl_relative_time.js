const rtf = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
console.log(rtf.format(-1, "day"), rtf.format(2, "week"));
const lf = new Intl.ListFormat("en", { type: "conjunction" });
console.log(lf.format(["a", "b", "c"]));
