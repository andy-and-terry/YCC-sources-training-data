Object subclass: SkipList [
    | maxLevel levels random |
    SkipList class >> new: max [
        | sl |
        sl := super new.
        sl setMaxLevel: max.
        ^sl
    ]

    setMaxLevel: max [
        maxLevel := max.
        random := Random new.
        levels := Array new: max.
        1 to: max do: [ :i | levels at: i put: SortedCollection new ].
    ]

    insert: value [
        | level |
        level := 1.
        [ level < maxLevel and: [ random next < 0.5 ] ] whileTrue: [ level := level + 1 ].
        1 to: level do: [ :i | (levels at: i) add: value ].
    ]

    includes: value [
        ^(levels at: 1) includes: value
    ]

    firstLevel [
        ^levels at: 1
    ]
]

| list |
list := SkipList new: 3.
#(3 1 4 1 5 9 2 6) do: [ :v | list insert: v ].
Transcript showCr: list firstLevel printString.
Transcript showCr: (list includes: 5) printString.
Transcript showCr: (list includes: 7) printString.
