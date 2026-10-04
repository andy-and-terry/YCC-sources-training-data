object GroupByPartitionDemo {
  case class Employee(name: String, dept: String, salary: Int)

  def main(args: Array[String]): Unit = {
    val staff = List(
      Employee("Ann", "eng", 120),
      Employee("Bob", "ops", 80),
      Employee("Cy", "eng", 100),
      Employee("Dee", "ops", 90),
      Employee("Eve", "hr", 70)
    )

    val byDept = staff.groupBy(_.dept)
    for ((dept, es) <- byDept.toSeq.sortBy(_._1)) {
      println(s"$dept: ${es.map(_.name).mkString(", ")}")
    }

    val avg = byDept.view.mapValues(es => es.map(_.salary).sum.toDouble / es.size).toMap
    println(avg.toSeq.sortBy(_._1))

    val (high, low) = staff.partition(_.salary >= 90)
    println(high.map(_.name))
    println(low.map(_.name))

    println(staff.groupMapReduce(_.dept)(_.salary)(_ + _).toSeq.sorted)
    println(staff.groupBy(_.name.length).keys.toList.sorted)
    println(staff.span(_.salary > 90))
    println(staff.splitAt(2)._1.map(_.name))
    println(staff.map(_.dept).distinct)
    println(staff.map(_.dept).groupBy(identity).view.mapValues(_.size).toMap.toSeq.sorted)
  }
}
