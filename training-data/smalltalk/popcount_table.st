"Population count (number of set bits) for 0..15"
| bits |
bits := nil.
bits := [:n | n = 0 ifTrue: [0] ifFalse: [(n \\ 2) + (bits value: n // 2)]].

0 to: 15 do: [:n | Transcript show: (bits value: n) printString; show: ' '].
Transcript cr.
