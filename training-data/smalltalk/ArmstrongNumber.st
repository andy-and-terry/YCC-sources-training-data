Object subclass: ArmstrongNumber [
    ArmstrongNumber class >> isArmstrong: n [
        | digitsStr power total d |
        digitsStr := n printString.
        power := digitsStr size.
        total := 0.
        digitsStr do: [ :c |
            d := c digitValue.
            total := total + (d raisedTo: power).
        ].
        ^total = n
    ]
]

Transcript showCr: (ArmstrongNumber isArmstrong: 153) printString.
Transcript showCr: (ArmstrongNumber isArmstrong: 154) printString.
