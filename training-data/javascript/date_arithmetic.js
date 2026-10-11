function addDays(date, days) {
  const d = new Date(date);
  d.setUTCDate(d.getUTCDate() + days);
  return d;
}

function daysBetween(a, b) {
  const msPerDay = 24 * 60 * 60 * 1000;
  return Math.round((b - a) / msPerDay);
}

function isLeapYear(y) {
  return (y % 4 === 0 && y % 100 !== 0) || y % 400 === 0;
}

function endOfMonth(year, month) {
  return new Date(Date.UTC(year, month + 1, 0));
}

const start = new Date("2024-02-27T00:00:00Z");
console.log(addDays(start, 3).toISOString().slice(0, 10));
console.log(daysBetween(start, new Date("2024-12-25T00:00:00Z")));
console.log(isLeapYear(2024), isLeapYear(1900));
console.log(endOfMonth(2024, 1).getUTCDate());
