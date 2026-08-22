Object subclass: Fibonacci [
    Fibonacci class >> upTo: n [
        | result a b temp |
        result := OrderedCollection new.
        a := 0.
        b := 1.
        n timesRepeat: [
            result add: a.
            temp := a + b.
            a := b.
            b := temp.
        ].
        ^result
    ]
]

Transcript showCr: (Fibonacci upTo: 11) printString.
