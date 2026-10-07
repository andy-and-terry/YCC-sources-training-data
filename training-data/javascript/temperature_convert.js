const toCelsius = { C: (v) => v, F: (v) => ((v - 32) * 5) / 9, K: (v) => v - 273.15 };
const fromCelsius = { C: (v) => v, F: (v) => (v * 9) / 5 + 32, K: (v) => v + 273.15 };

function convert(value, from, to) {
  if (!(from in toCelsius) || !(to in fromCelsius)) throw new Error(`unknown unit ${from}/${to}`);
  return fromCelsius[to](toCelsius[from](value));
}

console.log(convert(100, "C", "F"));
console.log(convert(212, "F", "K").toFixed(2));
