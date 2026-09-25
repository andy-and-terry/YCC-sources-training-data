const isPangram = (s) => new Set(s.toLowerCase().match(/[a-z]/g) || []).size === 26;

console.log(isPangram("The quick brown fox jumps over the lazy dog"));
console.log(isPangram("Hello world"));
