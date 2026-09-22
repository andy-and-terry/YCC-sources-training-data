// Scala's `object` keyword is a built-in, thread-safe singleton (backed by
// a JVM static holder), so the classic GoF Singleton needs no boilerplate
// double-checked-locking -- this demonstrates the idiom plus lazy init.
object ConfigRegistry {
  private var settings: Map[String, String] = Map.empty
  private var initCount = 0

  def init(defaults: Map[String, String]): Unit = {
    settings = defaults
    initCount += 1
  }

  def get(key: String): Option[String] = settings.get(key)

  def set(key: String, value: String): Unit = {
    settings = settings.updated(key, value)
  }

  def timesInitialized: Int = initCount
}

// A companion-object-guarded singleton where the class itself has a
// private constructor, so callers can only reach it through `instance`.
class Logger private () {
  private val buffer = scala.collection.mutable.ListBuffer[String]()

  def log(message: String): Unit = buffer += message
  def history: List[String] = buffer.toList
}

object Logger {
  val instance: Logger = new Logger()
}

object SingletonPatternDemo {
  def main(args: Array[String]): Unit = {
    ConfigRegistry.init(Map("env" -> "dev", "retries" -> "3"))
    ConfigRegistry.set("env", "prod")
    println(s"env=${ConfigRegistry.get("env").getOrElse("?")}")
    println(s"timesInitialized=${ConfigRegistry.timesInitialized}")

    Logger.instance.log("service started")
    Logger.instance.log("request handled")
    // Same reference everywhere: no matter how many times we ask for it,
    // it's the one instance from the companion object.
    println(s"same instance? ${Logger.instance eq Logger.instance}")
    println(Logger.instance.history)
  }
}
