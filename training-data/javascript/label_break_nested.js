outer: for (let i = 0; i < 5; i++) {
  for (let j = 0; j < 5; j++) {
    if (i * j === 6) { console.log("found", i, j); break outer; }
  }
}
