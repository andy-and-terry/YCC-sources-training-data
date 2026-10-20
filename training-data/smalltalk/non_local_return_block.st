Object subclass: Finder [
    firstEven: coll [
        coll do: [:x | x even ifTrue: [^x]].
        ^nil
    ]
]
(Finder new firstEven: #(1 3 6 8)) printNl.
