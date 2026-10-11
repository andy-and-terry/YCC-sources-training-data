object FunctorTypeClass {
  trait Functor[F[_]] {
    def map[A, B](fa: F[A])(f: A => B): F[B]
  }

  implicit val listFunctor: Functor[List] = new Functor[List] {
    def map[A, B](fa: List[A])(f: A => B): List[B] = fa.map(f)
  }
  implicit val optionFunctor: Functor[Option] = new Functor[Option] {
    def map[A, B](fa: Option[A])(f: A => B): Option[B] = fa.map(f)
  }

  case class Box[A](value: A)
  implicit val boxFunctor: Functor[Box] = new Functor[Box] {
    def map[A, B](fa: Box[A])(f: A => B): Box[B] = Box(f(fa.value))
  }

  def double[F[_]](fa: F[Int])(implicit F: Functor[F]): F[Int] = F.map(fa)(_ * 2)

  def main(args: Array[String]): Unit = {
    println(double(List(1, 2, 3)))
    println(double(Option(21)))
    println(double(Box(8)))
    println(double(Option.empty[Int]))
  }
}
