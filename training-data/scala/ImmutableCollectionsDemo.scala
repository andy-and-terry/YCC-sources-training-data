object ImmutableCollectionsDemo {
  def main(args: Array[String]): Unit = {
    val original = Vector(1, 2, 3)
    val updated = original :+ 4
    val scores = Map("Ada" -> 88, "Bob" -> 72)
    val moreScores = scores + ("Cleo" -> 95)

    println(original)
    println(updated)
    println(scores)
    println(moreScores)
  }
}
