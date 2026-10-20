| nums |
nums := #(3 1 4 1 5).
(nums inject: 0 into: [:a :b | a + b]) printNl.
(nums collect: [:x | x * x]) printNl.
(nums detect: [:x | x > 3]) printNl.
