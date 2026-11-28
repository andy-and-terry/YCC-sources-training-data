def escape(cr: Double, ci: Double): Int =
  Iterator.iterate((0.0, 0.0, 0)) { case (zr, zi, n) =>
    (zr * zr - zi * zi + cr, 2 * zr * zi + ci, n + 1)
  }.dropWhile { case (zr, zi, n) => n < 30 && zr * zr + zi * zi < 4 }.next()._3

@main def mandelbrot(): Unit =
  for yi <- -5 to 5 do
    println((-40 to 12).map(xi => if escape(xi / 20.0, yi / 5.0) == 30 then '#' else '.').mkString)
