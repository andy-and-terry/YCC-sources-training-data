| gould |
gould := [:n | 1 bitShift: (n printString: 2) asBag occurrencesOf: $1].
Transcript showCr: ((0 to: 15) collect: [:n | gould value: n]) printString.
