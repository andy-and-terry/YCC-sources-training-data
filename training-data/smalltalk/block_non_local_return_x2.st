Object subclass: Finder [
    findFirstEven: coll [
        coll do: [:x | x even ifTrue: [^x]].
        ^nil
    ]
]
Transcript showCr: (Finder new findFirstEven: #(1 3 6 8)) printString.
