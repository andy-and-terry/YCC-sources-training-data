Object subclass: Animal [
    sound [ ^self subclassResponsibility ]
    speak [ ^self class name, ' says ', self sound ]
]

Animal subclass: Cow [
    sound [ ^'moo' ]
]

Animal subclass: Fish [
]

Transcript showCr: Cow new speak.
[ Fish new speak ] on: Error do: [ :e |
    Transcript showCr: 'error: ', e messageText printString ].
Transcript showCr: 'done'.
