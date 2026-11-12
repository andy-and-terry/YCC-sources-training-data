object ListPM extends App {
  def sum(l: List[Int]): Int = l match { case Nil => 0; case h :: t => h + sum(t) }
  def desc(l: List[Int]) = l match { case Nil => "empty"; case _ :: Nil => "one"; case a :: b :: _ => s"starts $a,$b" }
  println(sum(List(1, 2, 3)) + " " + desc(List(4, 5, 6)))
}
