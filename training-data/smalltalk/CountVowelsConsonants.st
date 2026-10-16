| text vowels consonants other freq |
text := 'The Quick Brown Fox, 42 times!'.
vowels := 0. consonants := 0. other := 0.
text do: [ :c |
    c isLetter
        ifTrue: [ c isVowel ifTrue: [ vowels := vowels + 1 ] ifFalse: [ consonants := consonants + 1 ] ]
        ifFalse: [ other := other + 1 ] ].
Transcript showCr: 'vowels: ', vowels printString.
Transcript showCr: 'consonants: ', consonants printString.
Transcript showCr: 'other: ', other printString.

freq := Bag new.
text asLowercase do: [ :c | c isLetter ifTrue: [ freq add: c ] ].
Transcript showCr: (freq occurrencesOf: $o) printString.
Transcript showCr: freq asSet size printString.
