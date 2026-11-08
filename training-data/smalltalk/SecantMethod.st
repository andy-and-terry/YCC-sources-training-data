Object subclass: Secant [
    Secant class >> root: f from: a0 to: b0 [
        | a b c |
        a := a0. b := b0.
        40 timesRepeat: [
            (f value: a) = (f value: b) ifFalse: [
                c := b - (((f value: b) * (b - a)) / ((f value: b) - (f value: a))).
                a := b. b := c]].
        ^b
    ]
]

(Secant root: [:x | x * x - 2.0] from: 1.0 to: 2.0) printNl.
