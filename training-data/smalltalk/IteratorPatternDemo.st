Object subclass: Countdown [
    | current |
    from: n [ current := n ]
    hasNext [ ^current > 0 ]
    next [
        | v |
        v := current.
        current := current - 1.
        ^v
    ]
]

| it |
it := Countdown new from: 5; yourself.
[ it hasNext ] whileTrue: [ Transcript show: it next printString; show: ' ' ].
Transcript cr.
