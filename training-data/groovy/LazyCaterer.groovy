int pieces(int cuts) { (cuts * cuts + cuts + 2).intdiv(2) }

println (0..9).collect { pieces(it) }.join(' ') // 1 2 4 7 11 16 22 29 37 46
