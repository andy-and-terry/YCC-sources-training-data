object OptionChainDemo {
  case class Config(values: Map[String, String])

  def lookup(config: Config, key: String): Option[String] = config.values.get(key)

  def resolvePort(config: Config, envPort: Option[String]): Int = {
    envPort
      .orElse(lookup(config, "port"))
      .flatMap(s => scala.util.Try(s.toInt).toOption)
      .filter(p => p > 0 && p < 65536)
      .getOrElse(8080)
  }

  def main(args: Array[String]): Unit = {
    val config = Config(Map("port" -> "9090", "host" -> "localhost"))

    println(resolvePort(config, None))
    println(resolvePort(config, Some("3000")))
    println(resolvePort(config, Some("not-a-number")))
    println(resolvePort(Config(Map.empty), None))

    val summary = for {
      host <- lookup(config, "host")
      port <- lookup(config, "port")
    } yield s"$host:$port"
    println(summary.getOrElse("no address configured"))
  }
}
