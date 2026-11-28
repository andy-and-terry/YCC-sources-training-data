| isPrime isPalindrome result |
isPrime := [:n |
    n >= 2 and: [(2 to: n sqrtFloor) allSatisfy: [:d | n \\ d ~= 0]]].
isPalindrome := [:n | n printString = n printString reverse].

result := (2 to: 199) select: [:n | (isPalindrome value: n) and: [isPrime value: n]].
Transcript showCr: result printString. "(2 3 5 7 11 101 131 151 181 191)"
