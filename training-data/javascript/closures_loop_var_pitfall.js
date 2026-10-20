var fs = [];
for (var i = 0; i < 3; i++) fs.push(() => i);
console.log(fs.map((f) => f()));
const gs = [];
for (let j = 0; j < 3; j++) gs.push(() => j);
console.log(gs.map((f) => f()));
