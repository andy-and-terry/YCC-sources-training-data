Object subclass: DelannoyNumbers [
    DelannoyNumbers class >> central: n [
        | g |
        g := (1 to: n + 1) collect: [:i | Array new: n + 1 withAll: 1].
        2 to: n + 1 do: [:i |
            2 to: n + 1 do: [:j |
                (g at: i) at: j put: ((g at: i - 1) at: j) + ((g at: i) at: j - 1) + ((g at: i - 1) at: j - 1)]].
        ^(g at: n + 1) at: n + 1
    ]
]

((0 to: 5) collect: [:n | DelannoyNumbers central: n]) printNl.   "(1 3 13 63 321 1683 )"
