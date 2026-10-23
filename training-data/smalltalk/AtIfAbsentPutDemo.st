| cache calls |
cache := Dictionary new.
calls := 0.

3 timesRepeat: [
    cache at: #answer ifAbsent: [ calls := calls + 1. cache at: #answer put: 42 ]
].
Transcript showCr: 'computed ', calls printString, ' time(s)'.

Transcript showCr: (cache at: #missing ifAbsent: [ 'default' ]) printString.
Transcript showCr: (cache at: #answer ifPresent: [ :v | v + 1 ]) printString.
Transcript showCr: (cache removeKey: #answer) printString.
Transcript showCr: cache isEmpty printString.
