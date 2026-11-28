| s n i j k |
s := 'banana'.
n := s size.
i := 1.
[i <= n] whileTrue: [
    j := i + 1. k := i.
    [j <= n and: [(s at: k) <= (s at: j)]] whileTrue: [
        k := (s at: k) < (s at: j) ifTrue: [i] ifFalse: [k + 1].
        j := j + 1].
    [i <= k] whileTrue: [
        Transcript showCr: (s copyFrom: i to: i + j - k - 1).
        i := i + (j - k)]]
