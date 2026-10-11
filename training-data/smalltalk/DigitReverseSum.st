Object subclass: DigitMath [
    DigitMath class >> reverse: n [
        | rest rev |
        rest := n.
        rev := 0.
        [ rest > 0 ] whileTrue: [
            rev := rev * 10 + (rest \\ 10).
            rest := rest // 10 ].
        ^rev
    ]

    DigitMath class >> digitSum: n [
        ^n printString inject: 0 into: [ :acc :c | acc + c digitValue ]
    ]

    DigitMath class >> isPalindrome: n [
        ^n = (self reverse: n)
    ]
]

Transcript showCr: (DigitMath reverse: 12345) printString.
Transcript showCr: (DigitMath digitSum: 98765) printString.
Transcript showCr: (DigitMath isPalindrome: 12321) printString.
Transcript showCr: (DigitMath isPalindrome: 12345) printString.
Transcript showCr: ((1 to: 200) select: [ :n | DigitMath isPalindrome: n ]) size printString.
