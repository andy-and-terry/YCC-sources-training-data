function stern(count) {
  const s = [0, 1];
  for (let i = 2; i < count; i++) {
    const h = i >> 1;
    s.push(i % 2 === 0 ? s[h] : s[h] + s[h + 1]);
  }
  return s.slice(0, count);
}

console.log(stern(20).join(" "));
