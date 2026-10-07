const nextTerm = (s) => s.replace(/(\d)\1*/g, (run) => run.length + run[0]);

function* lookAndSay(count) {
  let s = "1";
  for (let i = 0; i < count; i++) {
    yield s;
    s = nextTerm(s);
  }
}

console.log([...lookAndSay(8)]);
