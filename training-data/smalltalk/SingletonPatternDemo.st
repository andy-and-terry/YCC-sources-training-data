Object subclass: AppConfig [
    AppConfig class [ | instance | ]

    AppConfig class >> default [
        instance isNil ifTrue: [ instance := self basicNew initialize ].
        ^instance
    ]

    | settings |
    initialize [ settings := Dictionary new. ^self ]

    at: key put: value [ settings at: key put: value ]
    at: key [ ^settings at: key ifAbsent: [ nil ] ]
]

| a b |
a := AppConfig default.
a at: #theme put: 'dark'.
b := AppConfig default.
Transcript showCr: (b at: #theme).
Transcript showCr: (a == b) printString.
