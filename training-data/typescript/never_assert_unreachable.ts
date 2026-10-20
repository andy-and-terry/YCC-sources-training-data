function assertNever(x: never): never { throw new Error("unexpected " + x); }
type T = "a" | "b";
function f(t: T) { if (t === "a") return 1; if (t === "b") return 2; return assertNever(t); }
console.log(f("b"));
