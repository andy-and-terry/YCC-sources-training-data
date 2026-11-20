// Remove consecutive duplicates with a foldLeft.
object DedupeAdjacent {
  def dedupe[A](xs: List[A]): List[A] =
    xs.foldLeft(List.empty[A])((acc, x) => if (acc.headOption.contains(x)) acc else x :: acc).reverse
  def main(args: Array[String]): Unit = println(dedupe("aabbbcdd".toList).mkString)
}
