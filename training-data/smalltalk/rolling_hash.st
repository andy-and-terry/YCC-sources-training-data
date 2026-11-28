| s h |
s := 'abcabc'.
1 to: s size - 2 do: [:i |
    h := 0.
    (s copyFrom: i to: i + 2) do: [:c | h := (h * 31 + c value) \\ 1000003].
    Transcript showCr: (i - 1) printString, ' ', h printString]
