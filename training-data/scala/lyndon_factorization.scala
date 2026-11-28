def duval(s: String): List[String] =
  val out = scala.collection.mutable.ListBuffer.empty[String]
  var i = 0
  while i < s.length do
    var j = i + 1; var k = i
    while j < s.length && s(k) <= s(j) do
      k = if s(k) < s(j) then i else k + 1
      j += 1
    while i <= k do
      out += s.substring(i, i + j - k)
      i += j - k
  out.toList

@main def run(): Unit = println(duval("banana"))
