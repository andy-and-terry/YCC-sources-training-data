function lazy(fn) {
  let done = false;
  let value;
  return () => {
    if (!done) {
      value = fn();
      done = true;
    }
    return value;
  };
}

let calls = 0;
const expensive = lazy(() => {
  calls++;
  return [1, 2, 3].reduce((a, b) => a + b);
});

console.log("calls before:", calls);
console.log(expensive(), expensive(), expensive());
console.log("calls after:", calls);

const or = (a, b) => a() || b();
console.log(or(() => true, () => { throw new Error("never runs"); }));
