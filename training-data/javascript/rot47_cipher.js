const rot47 = (s) =>
  [...s].map((c) => {
    const n = c.charCodeAt(0);
    return n >= 33 && n <= 126 ? String.fromCharCode(33 + ((n - 33 + 47) % 94)) : c;
  }).join("");

const e = rot47("Hello, World!");
console.log(e, rot47(e));
