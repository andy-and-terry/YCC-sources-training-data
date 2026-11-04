| secondLargest |
secondLargest := [:xs | (xs asSet asSortedCollection: [:a :b | a >= b]) asArray at: 2 ifAbsent: [nil]].
(secondLargest value: #(4 9 2 9 7)) printNl.
(secondLargest value: #(3 3)) printNl.
