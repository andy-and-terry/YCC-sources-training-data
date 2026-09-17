Object subclass: Calculator [
    add: a to: b [ ^a + b ]
    multiply: a by: b [ ^a * b ]
    square: a [ ^a * a ]
]

| calc |
calc := Calculator new.

Transcript showCr: (calc perform: #square: with: 5) printString.
Transcript showCr: (calc perform: #add:to: with: 2 with: 3) printString.
Transcript showCr: (calc respondsTo: #multiply:by:) printString.
Transcript showCr: (calc respondsTo: #divide:by:) printString.
