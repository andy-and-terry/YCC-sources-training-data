"Fibbinary numbers: no two adjacent 1 bits."
0 to: 49 do: [ :n |
    ((n bitAnd: (n bitShift: -1)) = 0)
        ifTrue: [ Transcript show: n printString; show: ' ' ] ].
Transcript cr.
