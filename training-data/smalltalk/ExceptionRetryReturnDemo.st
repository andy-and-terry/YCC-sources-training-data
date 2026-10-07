| attempts result r |
attempts := 0.
result := [
    attempts := attempts + 1.
    attempts < 3 ifTrue: [ Error signal: 'try again' ].
    'succeeded after ', attempts printString, ' attempts' ]
        on: Error
        do: [ :e | e retry ].
Transcript showCr: result.

r := [ Error signal: 'oops'. 'not reached' ]
    on: Error
    do: [ :e | e return: 'returned value' ].
Transcript showCr: r.

r := [ (Warning signal: 'careful') printString ]
    on: Warning
    do: [ :e | e resume: 'resumed with this' ].
Transcript showCr: r.

r := [ Error signal: 'msg'. 1 ]
    on: Error
    do: [ :e | e messageText size ].
Transcript showCr: r printString.

r := [ ZeroDivide new signal: 'custom zero'. 0 ]
    on: ZeroDivide
    do: [ :e | e class name ].
Transcript showCr: r.

r := [ 1 / 0 ] on: ZeroDivide do: [ :e | e messageText ].
Transcript showCr: r.

r := [ [ 1 / 0 ] ensure: [ Transcript showCr: 'ensure ran' ] ]
    on: ZeroDivide do: [ :e | -1 ].
Transcript showCr: r printString.

r := [ #(1 2 3) at: 10 ] on: Error do: [ :e | e class name ].
Transcript showCr: r.
r := [ Dictionary new at: #missing ] on: SystemExceptions.NotFound do: [ :e | 'not found' ].
Transcript showCr: r.
