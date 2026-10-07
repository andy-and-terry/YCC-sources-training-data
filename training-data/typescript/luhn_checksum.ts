export function luhnSum(digits: string): number {
  let sum = 0;
  for (let i = 0; i < digits.length; i++) {
    let d = Number(digits[digits.length - 1 - i]);
    if (i % 2 === 1) {
      d *= 2;
      if (d > 9) d -= 9;
    }
    sum += d;
  }
  return sum;
}

export function luhnValid(input: string): boolean {
  const digits = input.replace(/\D/g, "");
  return digits.length > 1 && luhnSum(digits) % 10 === 0;
}

export const luhnCheckDigit = (partial: string): number => (10 - (luhnSum(partial + "0") % 10)) % 10;

console.log(luhnValid("4539 3195 0343 6467"), luhnValid("8273 1232 7352 0569"));
console.log("check digit for 7992739871:", luhnCheckDigit("7992739871"));
