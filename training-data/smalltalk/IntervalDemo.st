| interval squares |
interval := 1 to: 10 by: 2.
Transcript showCr: interval printString.
Transcript showCr: interval asOrderedCollection printString.

squares := (1 to: 5) collect: [ :n | n * n ].
Transcript showCr: squares printString.

(1 to: 5) do: [ :n | Transcript show: n printString ] separatedBy: [ Transcript show: ', ' ].
Transcript nl.
