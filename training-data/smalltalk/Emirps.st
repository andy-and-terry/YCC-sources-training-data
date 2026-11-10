Object subclass: Emirps [
    Emirps class >> isPrime: n [
        n < 2 ifTrue: [^false].
        2 to: n sqrt floor do: [:d | n \\ d = 0 ifTrue: [^false]].
        ^true
    ]

    Emirps class >> reverse: n [
        ^n printString reverse asNumber
    ]

    Emirps class >> first: count [
        | out n r |
        out := OrderedCollection new.
        n := 2.
        [out size < count] whileTrue: [
            r := self reverse: n.
            (r ~= n and: [(self isPrime: n) and: [self isPrime: r]]) ifTrue: [out add: n].
            n := n + 1].
        ^out
    ]
]

(Emirps first: 10) printNl.   "OrderedCollection (13 17 31 37 71 73 79 97 107 113)"
