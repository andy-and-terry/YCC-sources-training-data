function isSelfDescribing(n) {
  const s = String(n);
  return [...s].every((d, i) => s.split(String(i)).length - 1 === Number(d));
}

[1210, 2020, 21200, 1211].forEach((n) => console.log(n, isSelfDescribing(n)));
