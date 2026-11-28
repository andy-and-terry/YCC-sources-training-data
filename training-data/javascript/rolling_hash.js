const s = "abcabc", k = 3, B = 31, M = 1000003;
let pw = 1, h = 0;
for (let i = 1; i < k; i++) pw = (pw * B) % M;
for (let i = 0; i < k; i++) h = (h * B + s.charCodeAt(i)) % M;
console.log(0, h);
for (let i = 1; i + k <= s.length; i++) {
  h = (h - ((s.charCodeAt(i - 1) * pw) % M) + M) % M;
  h = (h * B + s.charCodeAt(i + k - 1)) % M;
  console.log(i, h);
}
