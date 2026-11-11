"Integer (1..3999) to Roman numeral using a greedy table."
| values symbols toRoman |
values := #(1000 900 500 400 100 90 50 40 10 9 5 4 1).
symbols := #('M' 'CM' 'D' 'CD' 'C' 'XC' 'L' 'XL' 'X' 'IX' 'V' 'IV' 'I').
toRoman := [:number | | n out |
    n := number.
    out := WriteStream on: String new.
    values doWithIndex: [:v :i |
        [n >= v] whileTrue: [
            out nextPutAll: (symbols at: i).
            n := n - v]].
    out contents].
Transcript showCr: (toRoman value: 1994), ' ', (toRoman value: 58).
