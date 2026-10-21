"Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)"
| a b t |
a := 0.
b := 1.
15 timesRepeat: [
    Transcript show: a printString; show: ' '.
    t := b + (2 * a).
    a := b.
    b := t].
Transcript cr.
