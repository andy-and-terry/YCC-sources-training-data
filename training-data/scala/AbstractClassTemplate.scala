object AbstractClassTemplate {
  abstract class Report(val title: String) {
    def body: String
    def footer: String = "-- end --"
    final def render: String = s"== $title ==\n$body\n$footer"
  }

  class SalesReport(total: Double) extends Report("Sales") {
    def body = f"Total: $$$total%.2f"
  }

  class ErrorReport(errors: List[String]) extends Report("Errors") {
    def body = errors.map("* " + _).mkString("\n")
    override def footer = s"${errors.size} errors"
  }

  def main(args: Array[String]): Unit = {
    println(new SalesReport(1234.5).render)
    println(new ErrorReport(List("disk full", "timeout")).render)
  }
}
