object AbstractTypeMemberDemo {
  trait Container {
    type Elem
    def items: List[Elem]
    def describe(e: Elem): String
    def render: String = items.map(describe).mkString(", ")
  }

  class IntContainer(val items: List[Int]) extends Container {
    type Elem = Int
    def describe(e: Int): String = s"#$e"
  }

  class NameContainer(val items: List[String]) extends Container {
    type Elem = String
    def describe(e: String): String = e.capitalize
  }

  trait Codec {
    type Raw
    type Value
    def decode(r: Raw): Option[Value]
  }

  object NumberCodec extends Codec {
    type Raw = String
    type Value = Int
    def decode(r: String): Option[Int] = r.toIntOption
  }

  def decodeAll(c: Codec)(raws: List[c.Raw]): List[c.Value] = raws.flatMap(r => c.decode(r))

  def main(args: Array[String]): Unit = {
    println(new IntContainer(List(1, 2, 3)).render)
    println(new NameContainer(List("ada", "grace")).render)
    println(decodeAll(NumberCodec)(List("1", "x", "3")))
  }
}
