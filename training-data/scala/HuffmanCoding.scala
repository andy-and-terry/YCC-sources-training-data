import scala.collection.mutable

sealed trait HuffmanTree { def freq: Int }
case class Leaf(char: Char, freq: Int) extends HuffmanTree
case class Node(left: HuffmanTree, right: HuffmanTree, freq: Int) extends HuffmanTree

object HuffmanCoding {
  def buildTree(freqs: Map[Char, Int]): HuffmanTree = {
    val pq = mutable.PriorityQueue[HuffmanTree]()(Ordering.by((t: HuffmanTree) => t.freq).reverse)
    freqs.foreach { case (ch, f) => pq.enqueue(Leaf(ch, f)) }

    while (pq.size > 1) {
      val a = pq.dequeue()
      val b = pq.dequeue()
      pq.enqueue(Node(a, b, a.freq + b.freq))
    }
    pq.dequeue()
  }

  def codes(tree: HuffmanTree, prefix: String = ""): Map[Char, String] = tree match {
    case Leaf(ch, _) => Map(ch -> (if (prefix.isEmpty) "0" else prefix))
    case Node(left, right, _) => codes(left, prefix + "0") ++ codes(right, prefix + "1")
  }

  def main(args: Array[String]): Unit = {
    val text = "abracadabra"
    val freqs = text.groupBy(identity).view.mapValues(_.length).toMap
    val tree = buildTree(freqs)
    val table = codes(tree)
    table.toSeq.sortBy(_._1).foreach { case (ch, code) => println(s"$ch -> $code") }
  }
}
