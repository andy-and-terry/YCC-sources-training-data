| sentence words joined csv fields |
sentence := 'the quick brown fox jumps'.

words := sentence subStrings: ' '.
Transcript showCr: words printString.
Transcript showCr: words size printString.

joined := words inject: '' into: [ :acc :w |
    acc isEmpty ifTrue: [ w ] ifFalse: [ acc, '-', w ] ].
Transcript showCr: joined.

csv := 'ann,30,paris'.
fields := csv subStrings: ','.
Transcript showCr: fields first.
Transcript showCr: (fields at: 2) asNumber printString.

Transcript showCr: (sentence copyReplaceAll: 'quick' with: 'slow').
Transcript showCr: sentence asUppercase.
Transcript showCr: sentence reverse.
Transcript showCr: (sentence occurrencesOf: $o) printString.
Transcript showCr: (sentence indexOf: $q) printString.
Transcript showCr: (words collect: [ :w | w first asUppercase asString, (w copyFrom: 2) ]) printString.
Transcript showCr: (sentence includesSubstring: 'brown') printString.
