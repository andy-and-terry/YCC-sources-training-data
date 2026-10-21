// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
const n = [1, 1, 1];
for (let i = 3; i < 15; i++) n.push(n[i - 1] + n[i - 3]);
console.log(n.join(" "));
