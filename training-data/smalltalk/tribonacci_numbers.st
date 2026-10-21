"Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)"
| a b c next |
a := 0. b := 0. c := 1.
Transcript showCr: 'Tribonacci:'.
15 timesRepeat: [
    Transcript show: a printString; show: ' '.
    next := a + b + c.
    a := b. b := c. c := next].
Transcript cr.
