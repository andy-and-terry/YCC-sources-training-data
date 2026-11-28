| reverseBits |
reverseBits := [:value |
    | v r |
    v := value.
    r := 0.
    8 timesRepeat: [
        r := (r bitShift: 1) bitOr: (v bitAnd: 1).
        v := v bitShift: -1].
    r].

#(1 6 13 128) do: [:v |
    Transcript showCr: v printString, ' ', (reverseBits value: v) printString]. "128 96 176 1"
