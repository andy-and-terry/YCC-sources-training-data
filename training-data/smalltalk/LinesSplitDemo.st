| text lines words stream count longest |
text := 'alpha beta
gamma delta epsilon
zeta'.

lines := text lines.
Transcript showCr: lines size printString.
lines do: [ :l | Transcript showCr: '> ', l ].

words := lines collect: [ :l | l substrings: ' ' ].
Transcript showCr: (words collect: [ :w | w size ]) printString.

stream := ReadStream on: text.
count := 0.
[ stream atEnd ] whileFalse: [
    stream upTo: Character nl.
    count := count + 1 ].
Transcript showCr: 'line count: ', count printString.

longest := lines inject: '' into: [ :best :l |
    l size > best size ifTrue: [ l ] ifFalse: [ best ] ].
Transcript showCr: 'longest: ', longest.

Transcript showCr: (lines inject: 0 into: [ :a :l | a + l size ]) printString.
