"Aliquot sequence: replace n by the sum of its proper divisors."
| aliquotSum seq |
aliquotSum := [ :n | | s |
    s := 0.
    1 to: n // 2 do: [ :d | (n \\ d = 0) ifTrue: [ s := s + d ] ].
    s ].

seq := OrderedCollection with: 12.
[ seq last > 1 and: [ seq size < 20 ] ] whileTrue: [
    seq add: (aliquotSum value: seq last) ].
seq do: [ :x | Transcript show: x printString; show: ' ' ].
Transcript cr.
