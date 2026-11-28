| escape |
escape := [:cr :ci | | zr zi n t |
    zr := 0. zi := 0. n := 0.
    [n < 30 and: [(zr * zr) + (zi * zi) < 4]] whileTrue: [
        t := (zr * zr) - (zi * zi) + cr.
        zi := (2 * zr * zi) + ci.
        zr := t.
        n := n + 1].
    n].
-5 to: 5 do: [:yi |
    | line |
    line := WriteStream on: String new.
    -40 to: 12 do: [:xi |
        line nextPut: ((escape value: xi / 20.0 value: yi / 5.0) = 30 ifTrue: [$#] ifFalse: [$.])].
    Transcript showCr: line contents]
