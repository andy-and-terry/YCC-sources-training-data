"Disarium numbers: digits raised to their 1-based positions sum to n."
| isDisarium |
isDisarium := [ :n | | sum i |
    sum := 0.
    i := 0.
    n printString do: [ :c | i := i + 1. sum := sum + (c digitValue raisedTo: i) ].
    sum = n ].

1 to: 999 do: [ :n |
    (isDisarium value: n) ifTrue: [ Transcript show: n printString; show: ' ' ] ].
Transcript cr.
