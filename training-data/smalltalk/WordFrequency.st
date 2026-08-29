Object subclass: WordFrequency [
    WordFrequency class >> count: text [
        | words freq |
        words := text asLowercase substrings: ' '.
        freq := Dictionary new.
        words do: [ :w | freq at: w put: (freq at: w ifAbsent: [0]) + 1 ].
        ^freq
    ]
]

Transcript showCr: (WordFrequency count: 'the quick brown fox the lazy fox') printString.
