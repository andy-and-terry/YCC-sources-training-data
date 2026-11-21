"Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0)."
| isMunchausen |
isMunchausen := [ :n | | sum |
    sum := 0.
    n printString do: [ :c | | d |
        d := c digitValue.
        d > 0 ifTrue: [ sum := sum + (d raisedTo: d) ] ].
    sum = n ].

1 to: 4999 do: [ :n |
    (isMunchausen value: n) ifTrue: [ Transcript show: n printString; show: ' ' ] ].
Transcript cr.
