| pts sum n |
pts := #(#(0 0) #(4 0) #(4 3) #(0 3)).
n := pts size.
sum := 0.
1 to: n do: [:i | | a b |
    a := pts at: i.
    b := pts at: i \\ n + 1.
    sum := sum + ((a first * b last) - (b first * a last))].
Transcript showCr: (sum abs / 2) printString.
