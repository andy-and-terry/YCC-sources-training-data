Object subclass: RangeSum [
    | prefix |
    RangeSum class >> on: aCollection [
        ^self new setUp: aCollection
    ]
    setUp: aCollection [
        prefix := OrderedCollection with: 0.
        aCollection do: [:v | prefix add: prefix last + v]
    ]
    from: lo to: hi [
        ^(prefix at: hi + 1) - (prefix at: lo + 1)
    ]
]

((RangeSum on: #(3 1 4 1 5 9 2 6)) from: 2 to: 5) printNl.
