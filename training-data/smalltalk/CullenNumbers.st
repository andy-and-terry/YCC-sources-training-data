Object subclass: CullenNumbers [
    CullenNumbers class >> cullen: n [
        ^(n * (2 raisedTo: n)) + 1
    ]
]

1 to: 5 do: [:n |
    Transcript showCr: n printString, ' ', (CullenNumbers cullen: n) printString].
