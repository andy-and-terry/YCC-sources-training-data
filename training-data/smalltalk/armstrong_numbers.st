| isArmstrong result |
isArmstrong := [:n |
    | s |
    s := n printString.
    (s inject: 0 into: [:acc :c | acc + (c digitValue raisedTo: s size)]) = n].

result := (1 to: 999) select: [:n | isArmstrong value: n].
Transcript showCr: result printString. "(1 2 ... 9 153 370 371 407)"
