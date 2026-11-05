object LazyPrimes extends App {
  def sieve(s: LazyList[Int]): LazyList[Int] = s.head #:: sieve(s.tail.filter(_ % s.head != 0))
  println(sieve(LazyList.from(2)).take(10).toList)
}
