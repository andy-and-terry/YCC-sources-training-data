Object subclass: Registry [
    | entries |

    Registry class [ | default | ]

    Registry class >> default [
        ^default ifNil: [ default := self new ]
    ]

    entries [ ^entries ifNil: [ entries := OrderedCollection new ] ]
    register: x [ self entries add: x. ^x ]
]

Registry subclass: SubRegistry [
]

Registry default register: #a.
Registry default register: #b.
Transcript showCr: Registry default entries printString.
Transcript showCr: SubRegistry default entries printString.
Transcript showCr: (Registry default == Registry default) printString.
Transcript showCr: (Registry default == SubRegistry default) printString.
