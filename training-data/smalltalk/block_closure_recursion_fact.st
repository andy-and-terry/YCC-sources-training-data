| fact |
fact := nil.
fact := [:n | n <= 1 ifTrue: [1] ifFalse: [n * (fact value: n - 1)]].
(fact value: 10) printNl.
(1 to: 5) do: [:i | Transcript show: i printString; show: ' '].
Transcript cr.
5 timesRepeat: [Transcript show: '*'].
Transcript cr.
