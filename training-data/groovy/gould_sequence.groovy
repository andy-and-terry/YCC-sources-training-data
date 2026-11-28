int gould(int n) { 1 << Integer.bitCount(n) }

println((0..<16).collect { gould(it) })
