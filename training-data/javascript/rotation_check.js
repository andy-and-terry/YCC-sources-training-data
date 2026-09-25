const isRotation = (a, b) => a.length === b.length && (a + a).includes(b);

console.log(isRotation("waterbottle", "erbottlewat"));
console.log(isRotation("abc", "acb"));
