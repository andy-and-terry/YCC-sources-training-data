object MultiKeySorting {
  case class Student(name: String, grade: Int, age: Int)

  def main(args: Array[String]): Unit = {
    val students = List(
      Student("Mia", 90, 20), Student("Leo", 85, 22),
      Student("Ana", 90, 19), Student("Bob", 85, 22)
    )
    val byGradeThenName = students.sortBy(s => (-s.grade, s.name))
    byGradeThenName.foreach(println)

    val ord = Ordering.by[Student, Int](_.age).orElse(Ordering.by(_.name))
    println(students.sorted(ord).map(_.name))
    println(students.sortWith((a, b) => a.age > b.age || (a.age == b.age && a.name < b.name)).map(_.name))
    println(students.maxBy(_.grade).name)
    println(students.minBy(s => (s.age, s.name)).name)
  }
}
