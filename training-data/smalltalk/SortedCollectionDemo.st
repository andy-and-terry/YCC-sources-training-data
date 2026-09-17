| numbers sorted words byLength |
numbers := #(5 3 8 1 9 2).
sorted := SortedCollection new.
numbers do: [ :n | sorted add: n ].
Transcript showCr: sorted asArray printString.

words := #('banana' 'kiwi' 'strawberry' 'fig').
byLength := SortedCollection sortBlock: [ :a :b | a size < b size ].
words do: [ :w | byLength add: w ].
Transcript showCr: byLength asArray printString.
