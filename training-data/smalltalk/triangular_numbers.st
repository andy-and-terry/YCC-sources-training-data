| sum tri |
sum := 0.
tri := (1 to: 10) collect: [:n | sum := sum + n].
tri printNl.
