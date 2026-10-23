| selectors obj |
selectors := #(#size #reversed #asUppercase #foo).
obj := 'hello'.

selectors do: [:sel |
    (obj respondsTo: sel)
        ifTrue: [Transcript showCr: sel printString, ' -> ', (obj perform: sel) printString]
        ifFalse: [Transcript showCr: sel printString, ' not understood']].

Transcript showCr: (3 perform: #+ with: 4) printString.
Transcript showCr: (10 perform: #between:and: with: 1 with: 20) printString.
Transcript showCr: (#(3 1 2) perform: #asSortedCollection) asArray printString.

Transcript showCr: (Array with: 1 with: 2) printString.
Transcript showCr: (3 respondsTo: #printOn:) printString.
