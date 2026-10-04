object NamedDefaultArgsDemo {
  case class Server(host: String = "localhost", port: Int = 8080, secure: Boolean = false, workers: Int = 4) {
    def url: String = s"${if (secure) "https" else "http"}://$host:$port"
  }

  def connect(host: String, port: Int = 80, timeoutMs: Int = 1000, retries: Int = 3): String =
    s"$host:$port timeout=$timeoutMs retries=$retries"

  def sum(xs: Int*): Int = xs.sum

  def main(args: Array[String]): Unit = {
    println(connect("example.com"))
    println(connect("example.com", 443))
    println(connect("example.com", retries = 0))
    println(connect(timeoutMs = 50, host = "fast.io", port = 9))

    val base = Server()
    println(base.url)
    val prod = base.copy(host = "api.example.com", port = 443, secure = true)
    println(prod.url)
    println(prod)

    println(sum())
    println(sum(1, 2, 3))
    val nums = List(4, 5, 6)
    println(sum(nums: _*))
  }
}
