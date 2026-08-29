Object subclass: AnagramCheck [
    AnagramCheck class >> normalize: str [
        | chars |
        chars := (str asLowercase reject: [ :c | c = $  ]) asSortedCollection.
        ^chars asArray
    ]

    AnagramCheck class >> isAnagram: a with: b [
        ^(self normalize: a) = (self normalize: b)
    ]
]

Transcript showCr: (AnagramCheck isAnagram: 'listen' with: 'silent') printString.
Transcript showCr: (AnagramCheck isAnagram: 'hello' with: 'world') printString.
