class ListNode(val value: Int, var next: Option[ListNode] = None)

object LinkedListDemo {
  def reverseAndCollect(head: Option[ListNode]): List[Int] = {
    var prev: Option[ListNode] = None
    var cur = head
    while (cur.isDefined) {
      val node = cur.get
      val next = node.next
      node.next = prev
      prev = Some(node)
      cur = next
    }
    var result = List[Int]()
    var n = prev
    while (n.isDefined) {
      result = result :+ n.get.value
      n = n.get.next
    }
    result
  }

  def main(args: Array[String]): Unit = {
    val n4 = new ListNode(4)
    val n3 = new ListNode(3, Some(n4))
    val n2 = new ListNode(2, Some(n3))
    val n1 = new ListNode(1, Some(n2))
    println(reverseAndCollect(Some(n1)))
  }
}
