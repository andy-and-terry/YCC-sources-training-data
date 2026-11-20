"Lattice paths with a DP row."
| n row |
n := 3.
row := Array new: n + 1 withAll: 1.
n timesRepeat: [2 to: n + 1 do: [:j | row at: j put: (row at: j) + (row at: j - 1)]].
Transcript showCr: (row at: n + 1) printString.
