"perform: sends a message chosen at runtime."
| ops results obj |
Transcript showCr: (3 perform: #+ with: 4) printString.
Transcript showCr: ('hello' perform: #asUppercase).
Transcript showCr: (10 perform: #between:and: with: 1 with: 20) printString.
Transcript showCr: (#(3 1 2) perform: #asSortedCollection) asArray printString.

"Dispatch table of selectors"
ops := #(#+ #- #* #//).
results := ops collect: [:sel | 12 perform: sel with: 4].
Transcript showCr: results printString.

"Check understanding before sending"
obj := 'text'.
#(#size #reversed #fooBar) do: [:sel |
    (obj respondsTo: sel)
        ifTrue: [Transcript showCr: sel, ' -> ', (obj perform: sel) printString]
        ifFalse: [Transcript showCr: sel, ' not understood']].

"perform:withArguments: takes an Array"
Transcript showCr: (3 perform: #max: withArguments: #(9)) printString.
Transcript showCr: ('a-b-c' perform: #copyReplaceAll:with: withArguments: #('-' '+')).
