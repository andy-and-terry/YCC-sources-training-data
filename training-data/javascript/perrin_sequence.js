// Perrin sequence P(n)=P(n-2)+P(n-3)
const v = [3, 0, 2];
for (let i = 3; i < 10; i++) v.push(v[i - 2] + v[i - 3]);
console.log(v.join(" "));
