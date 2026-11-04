| gcdAll |
gcdAll := [:nums | nums inject: 0 into: [:acc :n | acc gcd: n]].
(gcdAll value: #(12 18 24)) printNl.
(gcdAll value: #(7 13)) printNl.
(4 lcm: 6) printNl.
