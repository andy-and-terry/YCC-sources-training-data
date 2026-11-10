// Read the binary digits of i as base-4 digits.
long moserDeBruijn(int i) { i == 0 ? 0L : Long.parseLong(Integer.toBinaryString(i), 4) }

println (0..9).collect { moserDeBruijn(it) }.join(' ') // 0 1 4 5 16 17 20 21 64 65
