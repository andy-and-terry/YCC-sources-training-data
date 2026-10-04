Integer extend [
    isPerfect [
        | sum |
        sum := 0.
        1 to: self - 1 do: [ :d | (self \\ d = 0) ifTrue: [ sum := sum + d ] ].
        ^sum = self
    ]

    collatzSteps [
        | n steps |
        n := self.
        steps := 0.
        [ n = 1 ] whileFalse: [
            n := n even ifTrue: [ n // 2 ] ifFalse: [ 3 * n + 1 ].
            steps := steps + 1 ].
        ^steps
    ]
]

String extend [
    isPalindromic [
        | clean |
        clean := (self select: [ :c | c isLetter ]) asLowercase.
        ^clean = clean reverse
    ]
]

Transcript showCr: ((1 to: 500) select: [ :n | n isPerfect ]) printString.
Transcript showCr: 27 collatzSteps printString.
Transcript showCr: 'A man, a plan, a canal: Panama' isPalindromic printString.
Transcript showCr: 'Smalltalk' isPalindromic printString.
