| results |
results := (1 to: 15) collect: [ :i |
    (i \\ 15 = 0)
        ifTrue: [ 'FizzBuzz' ]
        ifFalse: [
            (i \\ 3 = 0)
                ifTrue: [ 'Fizz' ]
                ifFalse: [ (i \\ 5 = 0) ifTrue: [ 'Buzz' ] ifFalse: [ i printString ] ] ] ].
results do: [ :r | Transcript show: r ] separatedBy: [ Transcript show: ' ' ].
Transcript cr.
Transcript showCr: (results count: [ :r | r = 'Fizz' ]) printString.
