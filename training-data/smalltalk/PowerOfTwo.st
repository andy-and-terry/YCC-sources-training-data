Object subclass: PowerOfTwo [
    PowerOfTwo class >> isPowerOfTwo: n [
        ^(n > 0) and: [ (n bitAnd: n - 1) = 0 ]
    ]
]

Transcript showCr: (PowerOfTwo isPowerOfTwo: 16) printString.
Transcript showCr: (PowerOfTwo isPowerOfTwo: 18) printString.
