object TraitLinearization {
  trait Base { def describe: String = "Base" }
  trait Loud extends Base { override def describe: String = "Loud(" + super.describe + ")" }
  trait Polite extends Base { override def describe: String = "Polite(" + super.describe + ")" }

  class A extends Base with Loud with Polite
  class B extends Base with Polite with Loud

  def main(args: Array[String]): Unit = {
    println(new A().describe)
    println(new B().describe)
    val anon = new Base with Loud { override def describe: String = "Anon+" + super.describe }
    println(anon.describe)
  }
}
