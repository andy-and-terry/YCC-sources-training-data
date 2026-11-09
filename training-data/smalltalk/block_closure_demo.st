| adder add5 |
adder := [:n | [:x | x + n]].
add5 := adder value: 5.
(add5 value: 10) printNl.
