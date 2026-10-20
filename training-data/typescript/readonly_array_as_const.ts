const DAYS = ["mon", "tue", "wed"] as const;
type Day = (typeof DAYS)[number];
function isDay(s: string): s is Day { return (DAYS as readonly string[]).includes(s); }
console.log(isDay("tue"), isDay("sun"));
