| n d |
n := 7.
d := (0 to: n) collect: [:i | Array new: n + 1 withAll: 1].
1 to: n do: [:i |
    1 to: n do: [:j |
        (d at: i + 1) at: j + 1 put:
            ((d at: i) at: j + 1) + ((d at: i + 1) at: j) + ((d at: i) at: j)]].
Transcript showCr: ((0 to: n) collect: [:i | (d at: i + 1) at: i + 1]) printString.
