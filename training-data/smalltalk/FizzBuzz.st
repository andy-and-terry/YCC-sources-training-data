1 to: 20 do: [ :i |
    (i \\ 15 = 0)
        ifTrue: [ Transcript showCr: 'FizzBuzz' ]
        ifFalse: [
            (i \\ 3 = 0)
                ifTrue: [ Transcript showCr: 'Fizz' ]
                ifFalse: [
                    (i \\ 5 = 0)
                        ifTrue: [ Transcript showCr: 'Buzz' ]
                        ifFalse: [ Transcript showCr: i printString ].
                ].
        ].
].
