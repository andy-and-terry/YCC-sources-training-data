| nums |
nums := #(3 1 4 1 5 9).
(nums inject: 0 into: [:a :b | a + b]) printNl.
(nums collect: [:x | x * x]) printNl.
(nums select: [:x | x odd]) printNl.
