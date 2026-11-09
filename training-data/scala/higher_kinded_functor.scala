trait Functor[F[_]] { def map[A, B](fa: F[A])(f: A => B): F[B] }

object Functor {
  given Functor[List] with { def map[A, B](fa: List[A])(f: A => B) = fa.map(f) }
  given Functor[Option] with { def map[A, B](fa: Option[A])(f: A => B) = fa.map(f) }
}

def double[F[_]](fa: F[Int])(using F: Functor[F]): F[Int] = F.map(fa)(_ * 2)

@main def hk(): Unit =
  println(double(List(1, 2, 3)))
  println(double(Option(5)))
