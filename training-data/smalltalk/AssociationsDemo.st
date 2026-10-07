| ages oldest names |
ages := Dictionary new.
ages at: 'Alice' put: 30.
ages at: 'Bob' put: 25.
ages at: 'Carol' put: 35.

ages keysAndValuesDo: [ :name :age |
    Transcript showCr: name, ' is ', age printString, ' years old'
].

oldest := (ages associations asSortedCollection: [ :a :b | a value >= b value ]) first.
Transcript showCr: 'oldest: ', oldest key, ' (', oldest value printString, ')'.

names := ages keys asSortedCollection asArray.
Transcript showCr: names printString.
