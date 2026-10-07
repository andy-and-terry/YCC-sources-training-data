Object subclass: BloomFilter [
    | bits size |
    BloomFilter class >> new: aSize [
        | bf |
        bf := super new.
        bf setSize: aSize.
        ^bf
    ]

    setSize: aSize [
        size := aSize.
        bits := Array new: aSize withAll: false.
    ]

    hashOf: aString seed: seed [
        | sum |
        sum := 0.
        aString do: [ :c | sum := sum + c asInteger ].
        ^((sum * seed) + seed) \\ size + 1
    ]

    add: aString [
        #(1 7 13) do: [ :seed | bits at: (self hashOf: aString seed: seed) put: true ].
    ]

    mightContain: aString [
        #(1 7 13) do: [ :seed |
            (bits at: (self hashOf: aString seed: seed)) ifFalse: [ ^false ].
        ].
        ^true
    ]
]

| filter |
filter := BloomFilter new: 32.
filter add: 'apple'.
filter add: 'banana'.
Transcript showCr: (filter mightContain: 'apple') printString.
Transcript showCr: (filter mightContain: 'cherry') printString.
