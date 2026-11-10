Object subclass: MoserDeBruijn [
    "Read the binary digits of i as base-4 digits."
    MoserDeBruijn class >> of: i [
        | x value power |
        x := i. value := 0. power := 1.
        [x > 0] whileTrue: [
            (x bitAnd: 1) = 1 ifTrue: [value := value + power].
            power := power * 4.
            x := x bitShift: -1].
        ^value
    ]
]

((0 to: 9) collect: [:i | MoserDeBruijn of: i]) printNl.   "(0 1 4 5 16 17 20 21 64 65 )"
