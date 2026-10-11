import scala.collection.mutable

object SetUniquenessDemo {
  def firstDuplicate(xs: List[Int]): Option[Int] = {
    val seen = mutable.HashSet[Int]()
    xs.find(x => !seen.add(x))
  }

  def main(args: Array[String]): Unit = {
    println(firstDuplicate(List(3, 1, 4, 1, 5, 9, 2, 6, 5)))
    println(firstDuplicate(List(1, 2, 3)))
    println(List(3, 1, 3, 2, 1).distinct)
    println(List("aa", "b", "cc", "d").distinctBy(_.length))
    val s = mutable.LinkedHashSet(5, 3, 5, 1)
    println(s)
    println(Set(1, 2, 3).subsetOf(Set(1, 2, 3, 4)))
    println(mutable.TreeSet(9, 2, 7).toList)
  }
}
