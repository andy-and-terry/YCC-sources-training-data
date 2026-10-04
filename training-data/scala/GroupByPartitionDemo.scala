object GroupByPartitionDemo {
  case class Emp(name: String, dept: String, salary: Int)

  def main(args: Array[String]): Unit = {
    val emps = List(Emp("Ann", "eng", 90), Emp("Bob", "ops", 60), Emp("Cy", "eng", 80), Emp("Di", "ops", 70))
    val byDept = emps.groupBy(_.dept)
    byDept.toList.sortBy(_._1).foreach { case (d, es) =>
      println(s"$d: ${es.map(_.name).mkString(",")} avg=${es.map(_.salary).sum / es.size}")
    }
    val (high, low) = emps.partition(_.salary >= 75)
    println(high.map(_.name))
    println(low.map(_.name))
    println(emps.groupMapReduce(_.dept)(_.salary)(_ + _))
    println(emps.maxBy(_.salary).name)
    println(emps.sortBy(e => (e.dept, -e.salary)).map(_.name))
    val (engPrefix, rest) = emps.span(_.dept == "eng")
    println((engPrefix.size, rest.size))
  }
}
