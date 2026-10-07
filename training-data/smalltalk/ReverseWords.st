| sentence words |
sentence := 'the quick brown fox'.
words := sentence substrings: ' '.
Transcript showCr: (words reverse inject: '' into: [ :acc :w |
    acc isEmpty ifTrue: [ w ] ifFalse: [ acc, ' ', w ] ]).
Transcript showCr: (words collect: [ :w | w reverse ]) asArray printString.
Transcript showCr: (words detectMax: [ :w | w size ]).
