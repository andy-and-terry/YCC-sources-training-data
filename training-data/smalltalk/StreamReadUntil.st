| rs words line |
rs := ReadStream on: 'alpha beta gamma delta'.
words := OrderedCollection new.
[ rs atEnd ] whileFalse: [ words add: (rs upTo: $ ) ].
Transcript showCr: words printString.

rs := ReadStream on: #(1 2 3 4 5 6).
Transcript showCr: rs next printString.
Transcript showCr: (rs next: 2) printString.
Transcript showCr: rs peek printString.
rs skip: 1.
Transcript showCr: rs upToEnd printString.
Transcript showCr: rs atEnd printString.

line := ReadStream on: 'key=value'.
Transcript showCr: (line upTo: $=).
Transcript showCr: line upToEnd.
