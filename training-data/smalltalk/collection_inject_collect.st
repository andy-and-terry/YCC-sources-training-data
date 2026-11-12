| xs |
xs := #(1 2 3 4 5).
(xs inject: 0 into: [:a :b | a + b]) printNl.
(xs collect: [:x | x * x]) printNl.
(xs select: [:x | x even]) printNl.
