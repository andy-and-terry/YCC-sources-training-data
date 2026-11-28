| a bs blk sum i l r |
a := #(5 3 8 1 9 2 7 4 6 0 3 5).
bs := 4.
blk := Array new: 3 withAll: 0.
a doWithIndex: [:v :idx | | b | b := (idx - 1) // bs + 1. blk at: b put: (blk at: b) + v].
l := 3. r := 10. sum := 0. i := l.
[i <= r] whileTrue: [
    ((i - 1) \\ bs = 0 and: [i + bs - 1 <= r])
        ifTrue: [sum := sum + (blk at: (i - 1) // bs + 1). i := i + bs]
        ifFalse: [sum := sum + (a at: i). i := i + 1]].
Transcript showCr: sum printString
