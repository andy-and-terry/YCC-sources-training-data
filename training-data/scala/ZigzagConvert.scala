object ZigzagConvert extends App {
  def zigzag(s: String, rows: Int): String = {
    if (rows == 1 || rows >= s.length) return s
    val lines = Array.fill(rows)(new StringBuilder)
    var (r, step) = (0, 1)
    for (c <- s) {
      lines(r).append(c)
      if (r == 0) step = 1 else if (r == rows - 1) step = -1
      r += step
    }
    lines.mkString
  }
  println(zigzag("PAYPALISHIRING", 3))
}
