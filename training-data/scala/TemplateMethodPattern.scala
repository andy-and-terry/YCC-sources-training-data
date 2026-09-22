abstract class ReportGenerator {
  final def generate(): Unit = {
    fetchData()
    processData()
    printReport()
  }

  protected def fetchData(): Unit
  protected def processData(): Unit = println("processing default data")
  protected def printReport(): Unit
}

class SalesReport extends ReportGenerator {
  protected def fetchData(): Unit = println("fetching sales data")
  protected def printReport(): Unit = println("Sales Report printed")
}

class InventoryReport extends ReportGenerator {
  protected def fetchData(): Unit = println("fetching inventory data")
  override protected def processData(): Unit = println("processing inventory with special rules")
  protected def printReport(): Unit = println("Inventory Report printed")
}

object TemplateMethodPatternDemo {
  def main(args: Array[String]): Unit = {
    new SalesReport().generate()
    new InventoryReport().generate()
  }
}
