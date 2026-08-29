Object subclass: PalindromeCheck [
    PalindromeCheck class >> isPalindrome: str [
        | normalized reversed |
        normalized := (str asLowercase select: [ :c | c isLetter or: [ c isDigit ] ]).
        reversed := normalized reversed.
        ^normalized = reversed
    ]
]

Transcript showCr: (PalindromeCheck isPalindrome: 'racecar') printString.
Transcript showCr: (PalindromeCheck isPalindrome: 'hello') printString.
