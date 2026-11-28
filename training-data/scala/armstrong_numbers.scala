object ArmstrongNumbers extends App {
  def isArmstrong(n: Int): Boolean = {
    val digits = n.toString.map(_ - '0')
    digits.map(d => math.pow(d, digits.length).toInt).sum == n
  }

  println((1 until 1000).filter(isArmstrong)) // 1..9, 153, 370, 371, 407
}
