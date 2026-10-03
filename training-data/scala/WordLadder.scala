import scala.collection.mutable

object WordLadder {
  def ladderLength(beginWord: String, endWord: String, wordList: Set[String]): Int = {
    if (!wordList.contains(endWord)) return 0

    val queue = mutable.Queue((beginWord, 1))
    val visited = mutable.Set(beginWord)

    while (queue.nonEmpty) {
      val (word, dist) = queue.dequeue()
      if (word == endWord) return dist

      for (i <- word.indices; c <- 'a' to 'z' if c != word(i)) {
        val candidate = word.updated(i, c)
        if (wordList.contains(candidate) && !visited.contains(candidate)) {
          visited += candidate
          queue.enqueue((candidate, dist + 1))
        }
      }
    }
    0
  }

  def main(args: Array[String]): Unit = {
    val words = Set("hot", "dot", "dog", "lot", "log", "cog")
    println(ladderLength("hit", "cog", words))
  }
}
