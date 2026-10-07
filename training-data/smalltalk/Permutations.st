Object subclass: Permutations [
    Permutations class >> of: aCollection [
        | result |
        aCollection size <= 1 ifTrue: [ ^OrderedCollection with: aCollection asOrderedCollection ].
        result := OrderedCollection new.
        aCollection doWithIndex: [ :x :i |
            | rest |
            rest := aCollection asOrderedCollection copy.
            rest removeIndex: i.
            (self of: rest) do: [ :p | result add: ((OrderedCollection with: x) addAll: p; yourself) ] ].
        ^result
    ]
]

(Permutations of: #(1 2 3)) do: [ :p | Transcript showCr: p asArray printString ].
