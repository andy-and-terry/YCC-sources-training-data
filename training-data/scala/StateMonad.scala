case class State[S, A](run: S => (A, S)) {
  def map[B](f: A => B): State[S, B] =
    State { s => val (a, s2) = run(s); (f(a), s2) }

  def flatMap[B](f: A => State[S, B]): State[S, B] =
    State { s => val (a, s2) = run(s); f(a).run(s2) }
}

object State {
  def get[S]: State[S, S] = State(s => (s, s))
  def put[S](s: S): State[S, Unit] = State(_ => ((), s))
  def modify[S](f: S => S): State[S, Unit] = State(s => ((), f(s)))
  def pure[S, A](a: A): State[S, A] = State(s => (a, s))
}

object StateMonadDemo {
  import State._

  def fresh: State[Int, Int] = for {
    n <- get[Int]
    _ <- put(n + 1)
  } yield n

  def main(args: Array[String]): Unit = {
    val prog = for {
      a <- fresh
      b <- fresh
      _ <- modify[Int](_ * 10)
      c <- fresh
    } yield List(a, b, c)
    println(prog.run(0))
  }
}
