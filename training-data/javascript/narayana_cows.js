// Narayana's cows N(n)=N(n-1)+N(n-3)
const v = [1, 1, 1];
for (let i = 3; i < 10; i++) v.push(v[i - 1] + v[i - 3]);
console.log(v.join(" "));
