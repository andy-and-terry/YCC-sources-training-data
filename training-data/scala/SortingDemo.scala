object SortingDemo {
  case class Employee(name: String, dept: String, salary: Int)

  def main(args: Array[String]): Unit = {
    val staff = List(
      Employee("Cy", "ops", 50), Employee("Ann", "dev", 70),
      Employee("Bo", "dev", 65), Employee("Di", "ops", 55)
    )

    println(staff.sortBy(_.salary).map(_.name))
    println(staff.sortBy(e => -e.salary).map(_.name))
    println(staff.sortBy(e => (e.dept, -e.salary)).map(_.name))
    println(staff.sortWith((a, b) => a.name.length < b.name.length || (a.name.length == b.name.length && a.name < b.name)).map(_.name))

    val bySalaryDesc: Ordering[Employee] = Ordering.by[Employee, Int](_.salary).reverse
    println(staff.sorted(bySalaryDesc).head.name)
    println(staff.min(Ordering.by[Employee, String](_.name)).name)

    implicit val deptThenName: Ordering[Employee] =
      Ordering.by(e => (e.dept, e.name))
    println(staff.sorted.map(_.name))

    println(List("b", "A", "c").sorted)
    println(List("b", "A", "c").sorted(Ordering.by[String, String](_.toLowerCase)))
    println(Array(3, 1, 2).sorted.toList)
    println(scala.util.Sorting.stableSort(Array(5, 3, 4)).toList)
  }
}
