| words byLength desc people |
words := #('pear' 'fig' 'banana' 'kiwi' 'apple').

Transcript showCr: words asSortedCollection asArray printString.

byLength := words asSortedCollection: [ :a :b | a size <= b size ].
Transcript showCr: byLength asArray printString.

desc := words asSortedCollection: [ :a :b | a >= b ].
Transcript showCr: desc asArray printString.

Transcript showCr: (words asSortedCollection: [ :a :b | a last <= b last ]) asOrderedCollection printString.

people := OrderedCollection new.
people add: 'Ann' -> 31; add: 'Bo' -> 25; add: 'Cy' -> 40.
Transcript showCr: (people asSortedCollection: [ :a :b | a value <= b value ]) first key.
Transcript showCr: (people asSortedCollection: [ :a :b | a value >= b value ]) first key.
Transcript showCr: (#(3 1 2) asSortedCollection add: 0; yourself) asArray printString.
