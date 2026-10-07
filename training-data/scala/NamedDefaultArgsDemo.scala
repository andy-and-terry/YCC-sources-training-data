object NamedDefaultArgsDemo {
  case class Connection(host: String = "localhost", port: Int = 5432, ssl: Boolean = false, timeoutMs: Int = 3000) {
    def url: String = s"${if (ssl) "https" else "http"}://$host:$port"
  }

  def format(value: Double, decimals: Int = 2, prefix: String = "", suffix: String = ""): String =
    s"$prefix%.${decimals}f$suffix".format(value)

  def main(args: Array[String]): Unit = {
    println(Connection().url)
    println(Connection(port = 8080).url)
    println(Connection(ssl = true, host = "example.com").url)

    val base = Connection(host = "db")
    val tuned = base.copy(timeoutMs = 500)
    println(tuned)

    println(format(3.14159))
    println(format(3.14159, 3))
    println(format(9.5, suffix = " %"))
    println(format(prefix = "$", value = 12.5, decimals = 0))

    def area(width: Int, height: Int = 1): Int = width * height
    println(area(5))
    println(area(height = 3, width = 4))
    println(List(1, 2, 3).map(area(_, 2)))
  }
}
