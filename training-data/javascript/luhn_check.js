function luhnValid(number) {
  const digits = number.replace(/\s/g, "");
  if (digits.length < 2 || /\D/.test(digits)) return false;
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

console.log(luhnValid("4539 3195 0343 6467"));
console.log(luhnValid("8273 1232 7352 0569"));
