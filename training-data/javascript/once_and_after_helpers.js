const once = (fn) => { let done = false, r; return (...a) => (done ? r : ((done = true), (r = fn(...a)))); };
const after = (n, fn) => { let c = 0; return (...a) => (++c >= n ? fn(...a) : undefined); };
const init = once(() => { console.log("init"); return 1; });
init(); init();
const third = after(3, () => "third!");
console.log(third(), third(), third());
