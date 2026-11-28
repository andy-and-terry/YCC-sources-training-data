class SqrtSum(a: Array[Int], bs: Int):
  private val blk = a.grouped(bs).map(_.sum).toArray

  def query(l: Int, r: Int): Int =
    var s = 0; var i = l
    while i <= r do
      if i % bs == 0 && i + bs - 1 <= r then { s += blk(i / bs); i += bs }
      else { s += a(i); i += 1 }
    s

@main def run(): Unit =
  println(SqrtSum(Array(5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5), 4).query(2, 9))
