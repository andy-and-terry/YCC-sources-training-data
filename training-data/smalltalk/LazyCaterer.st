Object subclass: LazyCaterer [
    LazyCaterer class >> pieces: cuts [
        ^(cuts * cuts + cuts + 2) // 2
    ]
]

((0 to: 9) collect: [:n | LazyCaterer pieces: n]) printNl.   "(1 2 4 7 11 16 22 29 37 46 )"
