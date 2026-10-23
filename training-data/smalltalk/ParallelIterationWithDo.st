| names ages pairs table sums |
names := #('Ann' 'Bob' 'Cy').
ages := #(31 27 45).

names with: ages do: [ :n :a |
    Transcript showCr: n, ' is ', a printString ].

pairs := names with: ages collect: [ :n :a | n -> a ].
Transcript showCr: pairs printString.

sums := #(1 2 3) with: #(10 20 30) collect: [ :x :y | x + y ].
Transcript showCr: sums printString.

table := Dictionary new.
names with: ages do: [ :n :a | table at: n put: a ].
Transcript showCr: (table at: 'Bob') printString.

names doWithIndex: [ :n :i |
    Transcript showCr: i printString, '. ', n ].

names keysAndValuesDo: [ :i :n |
    Transcript showCr: i printString, ': ', n ].

Transcript showCr: (names with: ages collect: [ :n :a | a > 30 ]) printString.
