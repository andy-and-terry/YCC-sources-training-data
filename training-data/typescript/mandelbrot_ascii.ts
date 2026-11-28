type Complex = { re: number; im: number };

const step = (z: Complex, c: Complex): Complex => ({
  re: z.re * z.re - z.im * z.im + c.re,
  im: 2 * z.re * z.im + c.im,
});

for (let y = -1; y <= 1; y += 0.2) {
  let line = "";
  for (let x = -2; x <= 0.6; x += 0.05) {
    let z: Complex = { re: 0, im: 0 };
    let n = 0;
    while (n < 30 && z.re ** 2 + z.im ** 2 < 4) {
      z = step(z, { re: x, im: y });
      n++;
    }
    line += n === 30 ? "#" : ".";
  }
  console.log(line);
}
