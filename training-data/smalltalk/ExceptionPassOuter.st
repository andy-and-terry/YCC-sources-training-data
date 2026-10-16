| r |
r := [
    [ Error signal: 'inner failure' ]
        on: Error
        do: [ :e |
            Transcript showCr: 'inner handler saw: ', e messageText.
            e pass ]
] on: Error do: [ :e |
    Transcript showCr: 'outer handler saw: ', e messageText.
    'handled outside' ].
Transcript showCr: r.

r := [
    [ Error signal: 'signal again' ]
        on: Error
        do: [ :e | e signal ]
] on: Error do: [ :e | 'second catch' ].
Transcript showCr: r.

r := [ [ 1/0 ] ensure: [ Transcript showCr: 'cleanup ran' ] ]
    on: ZeroDivide do: [ :e | -1 ].
Transcript showCr: r printString.
