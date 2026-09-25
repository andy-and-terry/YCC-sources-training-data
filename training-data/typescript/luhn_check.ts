export function luhnValid(input: string): boolean {
  const digits = input.replace(/\s/g, "");
  if (digits.length < 2 || /\D/.test(digits)) return false;
  let sum = 0;
  [...digits].reverse().forEach((ch, i) => {
    let d = Number(ch);
    if (i % 2 === 1) d = d * 2 > 9 ? d * 2 - 9 : d * 2;
    sum += d;
  });
  return sum % 10 === 0;
}

console.log(luhnValid("4539 3195 0343 6467"), luhnValid("8273 1232 7352 0569"));
