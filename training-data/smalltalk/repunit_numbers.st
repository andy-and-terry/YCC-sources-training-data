"Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1."
| r |
r := 0.
1 to: 8 do: [ :n |
    r := r * 10 + 1.
    Transcript show: r printString.
    (r \\ 3 = 0) ifTrue: [ Transcript show: '  (divisible by 3)' ].
    Transcript cr ].
