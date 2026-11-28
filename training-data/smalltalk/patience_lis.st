| tails |
tails := OrderedCollection new.
#(10 9 2 5 3 7 101 18) do: [:x | | idx |
    idx := tails findFirst: [:t | t >= x].
    idx = 0
        ifTrue: [tails add: x]
        ifFalse: [tails at: idx put: x]].
Transcript showCr: tails size printString
