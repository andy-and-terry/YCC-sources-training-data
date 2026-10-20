const trampoline = (f) => (...a) => { let r = f(...a); while (typeof r === "function") r = r(); return r; };
const sumTo = trampoline(function go(n, acc = 0) { return n === 0 ? acc : () => go(n - 1, acc + n); });
console.log(sumTo(100000));
