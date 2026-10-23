| text |
text := 'the quick brown fox jumps over the lazy dog'.
Transcript showCr: (text indexOfSubCollection: 'quick') printString.
Transcript showCr: (text indexOfSubCollection: 'brown fox') printString.
Transcript showCr: (text indexOfSubCollection: 'cat') printString.
Transcript showCr: (text indexOfSubCollection: 'the' startingAt: 2) printString.
Transcript showCr: (text includesSubstring: 'lazy') printString.
Transcript showCr: (text occurrencesOfString: 'the') printString.
Transcript showCr: (#(1 2 3 4 5 3 4) indexOfSubCollection: #(3 4)) printString.
Transcript showCr: (#(1 2 3 4 5 3 4) indexOfSubCollection: #(3 4) startingAt: 4) printString.
