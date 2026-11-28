@scala.annotation.tailrec
def gcd(a: Long, b: Long): Long = if b == 0 then a else gcd(b, a % b)

def rho(n: Long): Long =
  if n % 2 == 0 then 2
  else
    val f = (v: Long) => (v * v + 1) % n
    @scala.annotation.tailrec
    def loop(x: Long, y: Long): Long =
      val (nx, ny) = (f(x), f(f(y)))
      val d = gcd(math.abs(nx - ny), n)
      if d == 1 then loop(nx, ny) else d
    loop(2, 2)

@main def run(): Unit =
  val n = 8051L
  val p = rho(n)
  println(s"$n = $p * ${n / p}")
