for (let y = -1; y <= 1; y += 0.2) {
  let line = "";
  for (let x = -2; x <= 0.6; x += 0.05) {
    let zr = 0, zi = 0, n = 0;
    while (n < 30 && zr * zr + zi * zi < 4) {
      [zr, zi] = [zr * zr - zi * zi + x, 2 * zr * zi + y];
      n++;
    }
    line += n === 30 ? "#" : ".";
  }
  console.log(line);
}
