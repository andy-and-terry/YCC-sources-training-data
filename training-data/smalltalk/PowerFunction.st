Object subclass: PowerFunction [
    PowerFunction class >> power: base exp: exp [
        | half |
        exp = 0 ifTrue: [ ^1 ].
        exp \\ 2 = 0 ifTrue: [
            half := self power: base exp: exp // 2.
            ^half * half
        ].
        ^base * (self power: base exp: exp - 1)
    ]
]

Transcript showCr: (PowerFunction power: 2 exp: 10) printString.
Transcript showCr: (PowerFunction power: 3 exp: 5) printString.
