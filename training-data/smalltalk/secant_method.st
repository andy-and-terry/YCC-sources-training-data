| f x0 x1 f0 f1 next |
f := [:x | (x * x) - 2.0].
x0 := 1.0. x1 := 2.0.
50 timesRepeat: [
    f0 := f value: x0. f1 := f value: x1.
    f1 = f0 ifFalse: [
        next := x1 - (f1 * (x1 - x0) / (f1 - f0)).
        x0 := x1. x1 := next]].
Transcript showCr: x1 printString.
