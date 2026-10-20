type Up = Uppercase<"abc">;
type Lo = Lowercase<"ABC">;
const a: Up = "ABC", b: Lo = "abc";
console.log(a, b);
