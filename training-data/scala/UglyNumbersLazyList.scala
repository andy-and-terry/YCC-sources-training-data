object UglyNumbersLazyList extends App {
  // Classic lazy merge of the 2x, 3x and 5x streams.
  def merge(a: LazyList[BigInt], b: LazyList[BigInt]): LazyList[BigInt] =
    if (a.head < b.head) a.head #:: merge(a.tail, b)
    else if (a.head > b.head) b.head #:: merge(a, b.tail)
    else a.head #:: merge(a.tail, b.tail)

  lazy val ugly: LazyList[BigInt] =
    BigInt(1) #:: merge(merge(ugly.map(_ * 2), ugly.map(_ * 3)), ugly.map(_ * 5))

  println(ugly.take(12).toList)
}
