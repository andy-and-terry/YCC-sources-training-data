| items |
items := OrderedCollection new.
items add: 'text'; add: #sym; add: $c; add: 3/4; add: 2.5; add: #(1 $a 'b').

items do: [ :each |
    Transcript showCr: each printString, ' | ', each displayString ].

Transcript showCr: 'it''s' printString.
Transcript showCr: 'it''s' displayString.
Transcript showCr: 'abc' storeString.
Transcript showCr: #(1 2 3) displayString.
Transcript showCr: (1 to: 3) printString.
Transcript showCr: nil printString.
Transcript showCr: true displayString.
Transcript display: 'shown'; cr.
Transcript print: 'shown'; cr.
