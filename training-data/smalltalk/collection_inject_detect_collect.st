| nums |
nums := #(1 2 3 4 5 6).
(nums inject: 0 into: [:a :b | a + b]) printNl.
(nums collect: [:x | x * x]) printNl.
(nums select: [:x | x even]) printNl.
(nums detect: [:x | x > 4] ifNone: [nil]) printNl.
(nums reverse) printNl.
