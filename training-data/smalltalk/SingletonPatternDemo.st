Object subclass: AppConfig [
    AppConfig class [ | instance | ]
    | settings |

    AppConfig class >> default [
        instance isNil ifTrue: [ instance := super new initSettings ].
        ^instance
    ]

    initSettings [
        settings := Dictionary new.
        settings at: #theme put: 'dark'.
        ^self
    ]

    settingAt: key [
        ^settings at: key ifAbsent: [ nil ]
    ]

    settingAt: key put: value [
        settings at: key put: value
    ]
]

Transcript showCr: (AppConfig default settingAt: #theme).
AppConfig default settingAt: #theme put: 'light'.
Transcript showCr: (AppConfig default settingAt: #theme).
Transcript showCr: (AppConfig default == AppConfig default) printString.
