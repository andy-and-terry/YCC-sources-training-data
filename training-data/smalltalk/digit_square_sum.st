| digitSquareSum |
digitSquareSum := [:n |
    n abs printString inject: 0 into: [:acc :c | acc + (c digitValue * c digitValue)]].

(digitSquareSum value: 123) printNl.
(digitSquareSum value: -99) printNl.
