object ImmutableQueueDemo {
  final class Queue[+A] private (in: List[A], out: List[A]) {
    def enqueue[B >: A](x: B): Queue[B] = new Queue(x :: in, out)
    def dequeue: Option[(A, Queue[A])] = out match {
      case h :: t => Some((h, new Queue(in, t)))
      case Nil => in.reverse match {
        case Nil => None
        case h :: t => Some((h, new Queue(Nil, t)))
      }
    }
    def size: Int = in.size + out.size
    def isEmpty: Boolean = size == 0
  }
  object Queue {
    def empty[A]: Queue[A] = new Queue(Nil, Nil)
  }

  def main(args: Array[String]): Unit = {
    var q = Queue.empty[Int].enqueue(1).enqueue(2).enqueue(3)
    println(q.size)
    while (!q.isEmpty) {
      val Some((h, rest)) = q.dequeue
      print(h + " ")
      q = rest
    }
    println()
    println(scala.collection.immutable.Queue(1, 2).enqueue(3).dequeue)
  }
}
