object GroupByDemo {
  case class Employee(name: String, dept: String, salary: Int)

  def main(args: Array[String]): Unit = {
    val staff = List(
      Employee("Ann", "eng", 120),
      Employee("Bob", "ops", 90),
      Employee("Cy", "eng", 100),
      Employee("Di", "ops", 95)
    )

    val byDept = staff.groupBy(_.dept)
    byDept.toList.sortBy(_._1).foreach { case (d, es) =>
      println(s"$d: ${es.map(_.name).mkString(", ")}")
    }

    val totals = staff.groupMapReduce(_.dept)(_.salary)(_ + _)
    println(totals.toList.sorted)

    val avg = byDept.view.mapValues(es => es.map(_.salary).sum.toDouble / es.size).toMap
    println(avg.toList.sortBy(_._1))

    val (high, low) = staff.partition(_.salary >= 100)
    println(s"${high.map(_.name)} ${low.map(_.name)}")
    println("hello world".groupBy(identity).map { case (c, s) => c -> s.length }.maxBy(_._2))
  }
}
