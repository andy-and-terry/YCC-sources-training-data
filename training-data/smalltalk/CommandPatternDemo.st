Object subclass: Light [
    | isOn |
    Light class >> new [
        | l |
        l := super new.
        l setOff.
        ^l
    ]
    setOff [ isOn := false ]
    turnOn [ isOn := true. Transcript showCr: 'Light is ON' ]
    turnOff [ isOn := false. Transcript showCr: 'Light is OFF' ]
]

Object subclass: Command [
    execute [ ^self subclassResponsibility ]
    undo [ ^self subclassResponsibility ]
]

Command subclass: LightOnCommand [
    | light |
    light: l [ light := l ]
    execute [ light turnOn ]
    undo [ light turnOff ]
]

Command subclass: LightOffCommand [
    | light |
    light: l [ light := l ]
    execute [ light turnOff ]
    undo [ light turnOn ]
]

Object subclass: RemoteControl [
    | history |
    RemoteControl class >> new [
        | r |
        r := super new.
        r setHistory.
        ^r
    ]
    setHistory [ history := OrderedCollection new ]
    press: command [
        command execute.
        history addLast: command.
    ]
    undoLast [
        history isEmpty ifFalse: [
            history removeLast undo.
        ]
    ]
]

| light onCmd offCmd remote |
light := Light new.
onCmd := LightOnCommand new light: light; yourself.
offCmd := LightOffCommand new light: light; yourself.
remote := RemoteControl new.

remote press: onCmd.
remote press: offCmd.
remote undoLast.
