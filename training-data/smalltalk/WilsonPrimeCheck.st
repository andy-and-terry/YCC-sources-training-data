"Wilson's theorem primality test."
| wilson |
wilson := [:n | n >= 2 and: [((2 to: n - 1) inject: 1 into: [:f :i | f * i \\ n]) = (n - 1)]].
Transcript showCr: ((2 to: 19) select: [:n | wilson value: n]) printString.
