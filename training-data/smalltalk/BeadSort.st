"Bead (gravity) sort."
| nums cols rows |
nums := #(5 3 1 4 2).
cols := (1 to: nums max) collect: [:i | (nums count: [:n | n >= i])].
rows := ((1 to: nums size) collect: [:r | cols count: [:c | c >= r]]) reverse.
Transcript showCr: rows printString.
