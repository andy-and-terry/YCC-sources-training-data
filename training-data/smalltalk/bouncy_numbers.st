"Count bouncy numbers (neither increasing nor decreasing digits) below 1000."
| isBouncy count |
isBouncy := [ :n | | d |
    d := n printString asArray.
    (d = d asSortedCollection asArray) not
        and: [ (d = (d asSortedCollection: [ :a :b | a >= b ]) asArray) not ] ].

count := 0.
1 to: 999 do: [ :n | (isBouncy value: n) ifTrue: [ count := count + 1 ] ].
Transcript showCr: count printString.
