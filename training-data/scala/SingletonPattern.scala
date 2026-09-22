class ConnectionPool private () {
  private var connections = 0
  def acquire(): Int = { connections += 1; connections }
}

object ConnectionPool {
  val instance = new ConnectionPool()
}

object SingletonPatternDemo {
  def main(args: Array[String]): Unit = {
    val a = ConnectionPool.instance
    val b = ConnectionPool.instance
    println(a eq b)
    println(a.acquire())
    println(b.acquire())
  }
}
