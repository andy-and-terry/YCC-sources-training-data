Object subclass: RomanNumerals [
    RomanNumerals class >> toRoman: n [
        | values symbols result remaining |
        values := #(1000 900 500 400 100 90 50 40 10 9 5 4 1).
        symbols := #('M' 'CM' 'D' 'CD' 'C' 'XC' 'L' 'XL' 'X' 'IX' 'V' 'IV' 'I').
        result := ''.
        remaining := n.
        1 to: values size do: [ :i |
            [ remaining >= (values at: i) ] whileTrue: [
                result := result, (symbols at: i).
                remaining := remaining - (values at: i).
            ].
        ].
        ^result
    ]
]

Transcript showCr: (RomanNumerals toRoman: 1994).
