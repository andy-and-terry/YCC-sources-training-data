| h lo hi best |
h := #(1 8 6 2 5 4 8 3 7).
lo := 1. hi := h size. best := 0.
[lo < hi] whileTrue: [
    best := best max: ((h at: lo) min: (h at: hi)) * (hi - lo).
    (h at: lo) < (h at: hi)
        ifTrue: [lo := lo + 1]
        ifFalse: [hi := hi - 1]].
Transcript showCr: best printString. "49"
