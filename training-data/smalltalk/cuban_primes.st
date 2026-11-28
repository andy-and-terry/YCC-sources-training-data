| isPrime out y p |
isPrime := [:n | n >= 2 and: [(2 to: n sqrtFloor) allSatisfy: [:i | n \\ i ~= 0]]].
out := OrderedCollection new.
y := 1.
[out size < 8] whileTrue: [
    p := (3 * y * y) + (3 * y) + 1.
    (isPrime value: p) ifTrue: [out add: p].
    y := y + 1].
Transcript showCr: out printString.
