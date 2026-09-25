function luhnValid(number) {
  const digits = number.replace(/\D/g, "");
  if (digits.length < 2) return false;
  let sum = 0;
  for (let i = 0; i < digits.length; i++) {
    let d = Number(digits[digits.length - 1 - i]);
    if (i % 2 === 1) {
      d *= 2;
      if (d > 9) d -= 9;
    }
    sum += d;
  }
  return sum % 10 === 0;
}

function luhnCheckDigit(partial) {
  for (let d = 0; d < 10; d++) if (luhnValid(partial + d)) return d;
  throw new Error("unreachable");
}

console.log(luhnValid("4539 3195 0343 6467"), luhnValid("8273 1232 7352 0569"));
console.log("check digit for 7992739871:", luhnCheckDigit("7992739871"));
module.exports = { luhnValid, luhnCheckDigit };
