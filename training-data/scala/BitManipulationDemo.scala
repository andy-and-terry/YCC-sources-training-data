object BitManipulationDemo {
  def isPowerOfTwo(n: Int): Boolean = n > 0 && (n & (n - 1)) == 0

  def popCount(n: Int): Int = Iterator.iterate(n)(x => x & (x - 1)).takeWhile(_ != 0).size

  def singleNumber(nums: Seq[Int]): Int = nums.reduce(_ ^ _)

  def grayCode(bits: Int): Seq[Int] = (0 until (1 << bits)).map(i => i ^ (i >> 1))

  def main(args: Array[String]): Unit = {
    println(s"${isPowerOfTwo(64)} ${isPowerOfTwo(60)}")
    println(popCount(255) + " " + Integer.bitCount(255))
    println(singleNumber(Seq(4, 1, 2, 1, 2)))
    println(grayCode(3).map(g => Integer.toBinaryString(g).reverse.padTo(3, '0').reverse))
    println(40 & -40)
    println((1 << 10) + " " + (1024 >> 3) + " " + (-16 >>> 28) + " " + ~5)
    println(Integer.parseInt("1011", 2) + " " + Integer.toHexString(255))
  }
}
