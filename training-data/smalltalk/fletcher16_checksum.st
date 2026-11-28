| s1 s2 |
s1 := 0. s2 := 0.
'abcde' do: [:c |
    s1 := (s1 + c value) \\ 255.
    s2 := (s2 + s1) \\ 255].
Transcript showCr: ((s2 * 256) + s1) printString: 16.
