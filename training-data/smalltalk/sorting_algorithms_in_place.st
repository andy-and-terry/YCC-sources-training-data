Object subclass: Sorter [
    Sorter class >> bubble: anArray [
        | a swapped |
        a := anArray copy.
        [swapped := false.
         1 to: a size - 1 do: [:i |
            (a at: i) > (a at: i + 1) ifTrue: [a swap: i with: i + 1. swapped := true]].
         swapped] whileTrue.
        ^a
    ]
    Sorter class >> insertion: anArray [
        | a j key |
        a := anArray copy.
        2 to: a size do: [:i |
            key := a at: i. j := i - 1.
            [j >= 1 and: [(a at: j) > key]] whileTrue: [a at: j + 1 put: (a at: j). j := j - 1].
            a at: j + 1 put: key].
        ^a
    ]
    Sorter class >> quick: aCollection [
        | pivot rest |
        aCollection size <= 1 ifTrue: [^aCollection asArray].
        pivot := aCollection first. rest := aCollection allButFirst.
        ^(self quick: (rest select: [:x | x < pivot])), {pivot}, (self quick: (rest select: [:x | x >= pivot]))
    ]
]

| data |
data := #(5 2 9 1 5 6 3).
Transcript showCr: (Sorter bubble: data) printString.
Transcript showCr: (Sorter insertion: data) printString.
Transcript showCr: (Sorter quick: data) printString.
Transcript showCr: (data asSortedCollection: [:a :b | a >= b]) asArray printString.
Transcript showCr: (data asSortedCollection) first printString.
