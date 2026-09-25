import scala.util.Random

class SkipNode(val value: Int, val forward: Array[SkipNode])

class SkipList(maxLevel: Int = 4, p: Double = 0.5) {
  private val head = new SkipNode(Int.MinValue, Array.ofDim[SkipNode](maxLevel))
  private var level = 0
  private val random = new Random(42)

  private def randomLevel(): Int = {
    var lvl = 0
    while (lvl < maxLevel - 1 && random.nextDouble() < p) lvl += 1
    lvl
  }

  def insert(value: Int): Unit = {
    val update = Array.fill[SkipNode](maxLevel)(head)
    var current = head
    for (i <- level to 0 by -1) {
      while (current.forward(i) != null && current.forward(i).value < value) current = current.forward(i)
      update(i) = current
    }

    val newLevel = randomLevel()
    if (newLevel > level) {
      for (i <- level + 1 to newLevel) update(i) = head
      level = newLevel
    }

    val node = new SkipNode(value, Array.ofDim[SkipNode](newLevel + 1))
    for (i <- 0 to newLevel) {
      node.forward(i) = update(i).forward(i)
      update(i).forward(i) = node
    }
  }

  def contains(value: Int): Boolean = {
    var current = head
    for (i <- level to 0 by -1) {
      while (current.forward(i) != null && current.forward(i).value < value) current = current.forward(i)
    }
    current = current.forward(0)
    current != null && current.value == value
  }
}

object SkipListDemo {
  def main(args: Array[String]): Unit = {
    val list = new SkipList()
    List(3, 6, 7, 9, 12, 19, 17).foreach(list.insert)
    println(list.contains(9))
    println(list.contains(100))
    println(list.contains(17))
  }
}
