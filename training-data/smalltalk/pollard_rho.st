| rho n p |
rho := [:num | | x y d f |
    f := [:v | (v * v + 1) \\ num].
    x := 2. y := 2. d := 1.
    num even ifTrue: [2] ifFalse: [
        [d = 1] whileTrue: [
            x := f value: x.
            y := f value: (f value: y).
            d := (x - y) abs gcd: num].
        d]].
n := 8051.
p := rho value: n.
Transcript showCr: n printString, ' = ', p printString, ' * ', (n // p) printString
