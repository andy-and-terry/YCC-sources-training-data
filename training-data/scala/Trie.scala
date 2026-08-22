class TrieNode {
  val children = scala.collection.mutable.Map[Char, TrieNode]()
  var isEndOfWord = false
}

class Trie {
  private val root = new TrieNode

  def insert(word: String): Unit = {
    var node = root
    for (ch <- word) {
      node = node.children.getOrElseUpdate(ch, new TrieNode)
    }
    node.isEndOfWord = true
  }

  def search(word: String): Boolean = {
    var node = root
    for (ch <- word) {
      node.children.get(ch) match {
        case Some(next) => node = next
        case None => return false
      }
    }
    node.isEndOfWord
  }
}

object TrieDemo {
  def main(args: Array[String]): Unit = {
    val trie = new Trie
    List("cat", "car", "card").foreach(trie.insert)
    println(trie.search("car"))
    println(trie.search("ca"))
  }
}
