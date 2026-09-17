Object subclass: WordBreak [
    WordBreak class >> canBreak: s dict: dict [
        | n dp word |
        n := s size.
        dp := Array new: n + 1 withAll: false.
        dp at: 1 put: true.
        2 to: n + 1 do: [ :i |
            1 to: i - 1 do: [ :j |
                ((dp at: j) and: [ (dp at: i) not ]) ifTrue: [
                    word := s copyFrom: j to: i - 1.
                    (dict includes: word) ifTrue: [ dp at: i put: true ].
                ].
            ].
        ].
        ^dp at: n + 1
    ]
]

| dict |
dict := Set new.
dict add: 'smalltalk'; add: 'is'; add: 'fun'; add: 'lang'.

Transcript showCr: (WordBreak canBreak: 'smalltalkisfun' dict: dict) printString.
Transcript showCr: (WordBreak canBreak: 'smalltalklang' dict: dict) printString.
Transcript showCr: (WordBreak canBreak: 'nope' dict: dict) printString.
