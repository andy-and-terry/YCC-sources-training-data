"Shoelace polygon area using Point objects."
| pts s |
pts := {0@0. 4@0. 4@3. 0@3}.
s := 0.
pts doWithIndex: [:p :i | | q |
    q := pts at: i \\ pts size + 1.
    s := s + ((p x * q y) - (q x * p y))].
Transcript showCr: (s abs / 2) printString.
