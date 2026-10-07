Object subclass: NonLocalReturnDemo [
    findFirstNegative: aCollection [
        aCollection do: [ :each | each < 0 ifTrue: [ ^each ] ].
        ^nil
    ]

    indexOfLargest: aCollection [
        | best bestIndex |
        best := nil.
        aCollection doWithIndex: [ :each :i |
            (best isNil or: [ each > best ]) ifTrue: [ best := each. bestIndex := i ] ].
        ^bestIndex
    ]

    hasDuplicates: aCollection [
        | seen |
        seen := Set new.
        aCollection do: [ :each |
            (seen includes: each) ifTrue: [ ^true ].
            seen add: each ].
        ^false
    ]

    blockReturnsLocally [
        | r |
        r := [ :x | x * 2 ] value: 21.
        ^r
    ]
]

| demo |
demo := NonLocalReturnDemo new.
Transcript showCr: (demo findFirstNegative: #(3 5 -2 7 -9)) printString.
Transcript showCr: (demo findFirstNegative: #(1 2 3)) printString.
Transcript showCr: (demo indexOfLargest: #(4 9 2 9 1)) printString.
Transcript showCr: (demo hasDuplicates: #(1 2 3 2)) printString.
Transcript showCr: (demo hasDuplicates: #(1 2 3)) printString.
Transcript showCr: demo blockReturnsLocally printString.
