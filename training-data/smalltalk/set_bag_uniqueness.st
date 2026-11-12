| s b |
s := Set new. s add: 1; add: 2; add: 1.
s size printNl.
b := Bag new. b add: 'a'; add: 'a'; add: 'b'.
(b occurrencesOf: 'a') printNl.
