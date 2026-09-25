export function rotN(s: string, n: number): string {
  const k = ((n % 26) + 26) % 26;
  return s.replace(/[a-z]/gi, (c) => {
    const base = c <= "Z" ? 65 : 97;
    return String.fromCharCode(((c.charCodeAt(0) - base + k) % 26) + base);
  });
}

export const rot13 = (s: string): string => rotN(s, 13);

const text = "Why did the chicken cross the road?";
console.log(rot13(text));
console.log(rot13(rot13(text)) === text, rotN(rotN(text, 3), -3) === text);
