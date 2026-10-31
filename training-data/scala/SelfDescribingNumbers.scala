object SelfDescribingNumbers extends App {
  def isSelfDescribing(n: Long): Boolean = {
    val s = n.toString
    s.indices.forall(i => s.count(_ == ('0' + i).toChar) == s(i) - '0')
  }

  List(1210L, 2020L, 21200L, 1211L).foreach(n => println(s"$n ${isSelfDescribing(n)}"))
}
