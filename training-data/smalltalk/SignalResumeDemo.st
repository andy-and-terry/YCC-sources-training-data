| result |
result := [ (Warning signal: 'careful') printString ]
    on: Warning
    do: [ :e | e resume: 'resumed value' ].
Transcript showCr: result.

result := [ Error signal: 'boom'. 'after error' ]
    on: Error
    do: [ :e | e return: 'returned' ].
Transcript showCr: result.

result := [ Error signal: 'retry me'. 'unused' ]
    on: Error
    do: [ :e | e messageText ].
Transcript showCr: result.

result := [ 1/0 ] on: ZeroDivide do: [ :e | e class name ].
Transcript showCr: result.

result := [ #(1 2 3) at: 10 ] on: Error do: [ :e | 'index problem' ].
Transcript showCr: result.
result := [ nil foo ] on: MessageNotUnderstood do: [ :e | e message selector ].
Transcript showCr: result printString.
