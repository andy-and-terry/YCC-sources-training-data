| items counts top |
items := #(1 2 2 3 3 4).
counts := Bag new.
counts addAll: items.
top := (counts asSet inject: 0 into: [:m :x | m max: (counts occurrencesOf: x)]).
(counts asSet select: [:x | (counts occurrencesOf: x) = top]) asSortedCollection asArray printNl.
