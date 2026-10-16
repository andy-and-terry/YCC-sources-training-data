Object subclass: Duck [
    quack [ ^'Quack!' ]
]

Object subclass: Robot [
    beep [ ^'Beep.' ]
]

| things |
things := Array with: Duck new with: Robot new with: 'text' with: 7.
things do: [ :t |
    (t respondsTo: #quack)
        ifTrue: [ Transcript showCr: t class name, ' says ', t quack ]
        ifFalse: [ Transcript showCr: t class name, ' cannot quack' ] ].

Transcript showCr: (3 respondsTo: #printString) printString.
Transcript showCr: (3 respondsTo: #fly) printString.
Transcript showCr: ('abc' respondsTo: #size) printString.
