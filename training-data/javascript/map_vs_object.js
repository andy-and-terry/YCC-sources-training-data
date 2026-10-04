const obj = {};
obj[1] = "number key";
obj["1"] = "string key overwrites";
console.log(Object.keys(obj), obj[1]);

const map = new Map();
map.set(1, "number key");
map.set("1", "string key");
console.log(map.size, map.get(1), map.get("1"));

const objKey = { id: 1 };
const fnKey = () => {};
map.set(objKey, "object as key").set(fnKey, "function as key");
console.log(map.get(objKey), map.get({ id: 1 }));

map.set(NaN, "nan works");
console.log(map.get(NaN));

// Insertion order is preserved and iteration is direct.
const scores = new Map([["ann", 3], ["bob", 5]]);
scores.set("cy", 1);
for (const [k, v] of scores) console.log(k, v);

const sorted = new Map([...scores].sort((a, b) => b[1] - a[1]));
console.log([...sorted.keys()]);

// Plain objects inherit keys; use a null prototype when keys are untrusted.
console.log("toString" in {}, "toString" in Object.create(null));
console.log(Object.fromEntries(scores));
