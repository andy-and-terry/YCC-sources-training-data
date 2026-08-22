class CircularBuffer[T: reflect.ClassTag](capacity: Int) {
  private val buffer = new Array[Any](capacity)
  private var head = 0
  private var size = 0

  def add(item: T): Unit = {
    val tail = (head + size) % capacity
    buffer(tail) = item
    if (size < capacity) size += 1 else head = (head + 1) % capacity
  }

  def toList: List[T] = (0 until size).map(i => buffer((head + i) % capacity).asInstanceOf[T]).toList
}

object CircularBufferDemo {
  def main(args: Array[String]): Unit = {
    val cb = new CircularBuffer[Int](3)
    for (i <- 1 to 5) cb.add(i)
    println(cb.toList)
  }
}
