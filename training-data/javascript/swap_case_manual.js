const swapCase = (s) =>
  [...s].map((c) => (c === c.toUpperCase() ? c.toLowerCase() : c.toUpperCase())).join("");

console.log(swapCase("Hello World 42"));
