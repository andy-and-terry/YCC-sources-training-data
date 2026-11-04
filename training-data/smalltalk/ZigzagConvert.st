"Zigzag reading of a string across N rows (GNU Smalltalk)."
| zigzag |
zigzag := [:s :rows | | lines r step |
    (rows = 1 or: [rows >= s size]) ifTrue: [s] ifFalse: [
        lines := (1 to: rows) collect: [:i | WriteStream on: String new].
        r := 1. step := 1.
        s do: [:c |
            (lines at: r) nextPut: c.
            r = 1 ifTrue: [step := 1].
            r = rows ifTrue: [step := -1].
            r := r + step].
        (lines inject: '' into: [:acc :w | acc, w contents])]].
(zigzag value: 'PAYPALISHIRING' value: 3) displayNl.
