| s rots result |
s := 'banana$'.
rots := (1 to: s size) collect: [:i | (s copyFrom: i), (s copyFrom: 1 to: i - 1)].
rots := rots asSortedCollection: [:a :b | a <= b].
result := String new: s size.
rots doWithIndex: [:r :i | result at: i put: r last].
Transcript showCr: result
