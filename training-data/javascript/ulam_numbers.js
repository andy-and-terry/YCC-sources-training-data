function ulam(count) {
  const terms = [1, 2];
  const members = new Set(terms);
  let cand = 2;
  while (terms.length < count) {
    cand++;
    let ways = 0;
    for (const a of terms) {
      if (a < cand - a && members.has(cand - a)) ways++;
    }
    if (ways === 1) {
      terms.push(cand);
      members.add(cand);
    }
  }
  return terms;
}

console.log(ulam(15).join(" "));
