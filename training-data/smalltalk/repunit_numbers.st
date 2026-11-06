"Repunits: numbers made only of the digit 1."
| r out |
r := 0.
out := OrderedCollection new.
5 timesRepeat: [
    r := r * 10 + 1.
    out add: r ].
Transcript showCr: out printString.
