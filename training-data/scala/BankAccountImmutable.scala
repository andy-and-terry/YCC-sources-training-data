object BankAccountImmutable {
  sealed trait Txn
  final case class Deposit(amount: BigDecimal) extends Txn
  final case class Withdrawal(amount: BigDecimal) extends Txn

  final case class Account(history: Vector[Txn] = Vector.empty) {
    lazy val balance: BigDecimal = history.foldLeft(BigDecimal(0)) {
      case (acc, Deposit(a)) => acc + a
      case (acc, Withdrawal(a)) => acc - a
    }

    def deposit(a: BigDecimal): Either[String, Account] =
      if (a <= 0) Left("amount must be positive") else Right(copy(history :+ Deposit(a)))

    def withdraw(a: BigDecimal): Either[String, Account] =
      if (a > balance) Left(s"insufficient funds: have $balance") else Right(copy(history :+ Withdrawal(a)))
  }

  def main(args: Array[String]): Unit = {
    val result = for {
      a <- Account().deposit(100)
      b <- a.withdraw(30)
      c <- b.deposit(5)
    } yield c
    println(result.map(_.balance))
    println(result.flatMap(_.withdraw(1000)))
  }
}
