"n is triangular iff 8n + 1 is a perfect square."
| isTriangular |
isTriangular := [ :n | | s r |
    s := (8 * n) + 1.
    r := s sqrt rounded.
    (r * r) = s ].

0 to: 20 do: [ :n |
    (isTriangular value: n) ifTrue: [ Transcript show: n printString; show: ' ' ] ].
Transcript cr.
