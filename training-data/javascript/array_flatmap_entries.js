const sentences = ["hi there", "good day"];
console.log(sentences.flatMap((s) => s.split(" ")));
for (const [i, v] of ["x", "y"].entries()) console.log(i, v);
console.log(Object.fromEntries(new Map([["a", 1], ["b", 2]])));
