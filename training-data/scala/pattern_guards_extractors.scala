object Even { def unapply(n: Int): Option[Int] = if (n % 2 == 0) Some(n / 2) else None }

object Extract extends App {
  for (n <- List(4, 7, 10)) n match {
    case Even(h) if h > 3 => println(s"$n big even, half $h")
    case Even(h) => println(s"$n even, half $h")
    case _ => println(s"$n odd")
  }
}
