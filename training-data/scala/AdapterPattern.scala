// GoF Adapter pattern: wrap an incompatible interface so client code can
// depend on the interface it actually wants (`Printer`) instead of the
// legacy one (`LegacyPrinter`).
trait Printer {
  def print(message: String): Unit
}

// The "legacy" API we can't change: different method name, different
// signature (returns a status code instead of Unit).
class LegacyPrinter {
  def printLegacy(text: String, uppercase: Boolean): Int = {
    val out = if (uppercase) text.toUpperCase else text
    println(s"[legacy] $out")
    0
  }
}

class LegacyPrinterAdapter(legacy: LegacyPrinter) extends Printer {
  def print(message: String): Unit = {
    legacy.printLegacy(message, uppercase = true)
    ()
  }
}

// A second adaptee with yet another shape, to show one target interface
// can have multiple adapters.
class JsonLogger {
  def emit(fields: Map[String, String]): Unit =
    println(fields.map { case (k, v) => s""""$k":"$v"""" }.mkString("{", ",", "}"))
}

class JsonLoggerAdapter(logger: JsonLogger) extends Printer {
  def print(message: String): Unit = logger.emit(Map("message" -> message))
}

object AdapterPatternDemo {
  def notify(printer: Printer, message: String): Unit = printer.print(message)

  def main(args: Array[String]): Unit = {
    val legacyAdapter = new LegacyPrinterAdapter(new LegacyPrinter())
    val jsonAdapter = new JsonLoggerAdapter(new JsonLogger())

    val printers: List[Printer] = List(legacyAdapter, jsonAdapter)
    printers.foreach(p => notify(p, "system online"))
  }
}
