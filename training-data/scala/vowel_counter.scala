import scala.collection.immutable.SortedMap

object VowelCounter {
  def countVowels(s: String): SortedMap[Char, Int] =
    SortedMap.from(s.toLowerCase.filter("aeiou".contains(_)).groupBy(identity).view.mapValues(_.length))

  def main(args: Array[String]): Unit = println(countVowels("Education is beautiful"))
}
