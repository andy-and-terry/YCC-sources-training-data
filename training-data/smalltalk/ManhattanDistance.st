"Manhattan distance."
| a b |
a := #(1 2). b := #(4 6).
Transcript showCr: ((1 to: a size) inject: 0 into: [:s :i | s + ((a at: i) - (b at: i)) abs]) printString.
