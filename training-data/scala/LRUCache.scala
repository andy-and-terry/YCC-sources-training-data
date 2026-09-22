import scala.collection.mutable

class LRUCache[K, V](capacity: Int) {
  private val map = mutable.LinkedHashMap[K, V]()

  def get(key: K): Option[V] = {
    map.remove(key) match {
      case Some(value) =>
        map.put(key, value)
        Some(value)
      case None => None
    }
  }

  def put(key: K, value: V): Unit = {
    map.remove(key)
    if (map.size >= capacity) map.remove(map.head._1)
    map.put(key, value)
  }

  override def toString: String = map.toString
}

object LRUCache {
  def main(args: Array[String]): Unit = {
    val cache = new LRUCache[Int, String](2)
    cache.put(1, "a")
    cache.put(2, "b")
    println(cache.get(1))
    cache.put(3, "c")
    println(cache.get(2))
    println(cache)
  }
}
