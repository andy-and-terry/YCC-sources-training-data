proc maxOf[T](a, b: T): T = (if a > b: a else: b)
echo maxOf(3, 9), " ", maxOf("a", "b")
