proc minOf[T](a, b: T): T = (if a < b: a else: b)

echo minOf(3, 7), " ", minOf("pear", "apple")
