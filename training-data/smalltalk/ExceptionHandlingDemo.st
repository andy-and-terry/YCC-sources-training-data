Object subclass: ExceptionHandlingDemo [
    ExceptionHandlingDemo class >> safeDivide: a by: b [
        ^[ a / b ] on: ZeroDivide do: [ :e | Transcript showCr: 'Cannot divide by zero'. nil ]
    ]
]

Transcript showCr: (ExceptionHandlingDemo safeDivide: 10 by: 2) printString.
ExceptionHandlingDemo safeDivide: 10 by: 0.
