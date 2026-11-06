"Amicable pairs: d(a) = b and d(b) = a with a ~= b."
| d |
d := [:n | | s |
    s := 0.
    1 to: n - 1 do: [:i | (n \\ i = 0) ifTrue: [s := s + i]].
    s].
2 to: 1499 do: [:a | | b |
    b := d value: a.
    (b > a and: [(d value: b) = a])
        ifTrue: [Transcript showCr: a printString, ' ', b printString]].
