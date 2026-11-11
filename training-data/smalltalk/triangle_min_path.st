| triangle dp |
triangle := #(#(2) #(3 4) #(6 5 7) #(4 1 8 3)).
dp := triangle last copy.
(triangle size - 1) to: 1 by: -1 do: [:r |
    (triangle at: r) doWithIndex: [:v :i |
        dp at: i put: v + ((dp at: i) min: (dp at: i + 1))]].
Transcript showCr: dp first printString. "11"
