object DeltaEncoding extends App {
  def encode(xs: List[Int]): List[Int] = xs.head :: xs.zip(xs.tail).map { case (a, b) => b - a }
  def decode(ds: List[Int]): List[Int] = ds.scanLeft(0)(_ + _).tail

  val d = encode(List(10, 12, 15, 15, 20))
  println(d)
  println(decode(d))
}
