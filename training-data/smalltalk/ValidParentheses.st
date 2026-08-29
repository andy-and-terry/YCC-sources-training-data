Object subclass: ValidParentheses [
    ValidParentheses class >> isValid: str [
        | stack pairs c |
        stack := OrderedCollection new.
        pairs := Dictionary new.
        pairs at: $) put: $(.
        pairs at: $] put: $[.
        pairs at: $} put: ${.
        str do: [ :ch |
            (ch = $( or: [ ch = $[ or: [ ch = ${ ] ]) ifTrue: [ stack addLast: ch ].
            (ch = $) or: [ ch = $] or: [ ch = $} ] ]) ifTrue: [
                (stack isEmpty or: [ stack last ~= (pairs at: ch) ])
                    ifTrue: [ ^false ]
                    ifFalse: [ stack removeLast ].
            ].
        ].
        ^stack isEmpty
    ]
]

Transcript showCr: (ValidParentheses isValid: '{[()]}') printString.
Transcript showCr: (ValidParentheses isValid: '{[(])}') printString.
