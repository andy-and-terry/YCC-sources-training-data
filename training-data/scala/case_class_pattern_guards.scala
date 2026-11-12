object CaseGuards extends App {
  sealed trait Shape
  case class Circle(r: Double) extends Shape
  case class Rect(w: Double, h: Double) extends Shape
  def describe(s: Shape) = s match {
    case Circle(r) if r > 10 => "big circle"
    case Circle(_) => "circle"
    case Rect(w, h) if w == h => "square"
    case Rect(_, _) => "rect"
  }
  println(List(Circle(1), Circle(20), Rect(2, 2), Rect(2, 3)).map(describe))
}
