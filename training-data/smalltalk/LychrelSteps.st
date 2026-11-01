"Reverse-and-add until a palindrome; count the steps."
| rev steps |
rev := [ :n | n printString reverse asInteger ].

steps := [ :start | | n result |
    n := start. result := -1.
    0 to: 49 do: [ :count |
        (result = -1 and: [ count > 0 and: [ n = (rev value: n) ] ])
            ifTrue: [ result := count ].
        result = -1 ifTrue: [ n := n + (rev value: n) ] ].
    result ].

#(56 57 59 79 89) do: [ :s |
    Transcript show: (steps value: s) printString; show: ' ' ].
Transcript cr.
