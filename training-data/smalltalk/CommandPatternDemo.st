Object subclass: Light [
    | on |
    Light class >> new [ | l | l := super new. l setOff. ^l ]
    setOff [ on := false ]
    turnOn [ on := true. Transcript showCr: 'light on' ]
    turnOff [ on := false. Transcript showCr: 'light off' ]
    isOn [ ^on ]
]

Object subclass: LightOnCommand [
    | light |
    light: aLight [ light := aLight ]
    execute [ light turnOn ]
    undo [ light turnOff ]
]

Object subclass: LightOffCommand [
    | light |
    light: aLight [ light := aLight ]
    execute [ light turnOff ]
    undo [ light turnOn ]
]

Object subclass: RemoteControl [
    | history |
    RemoteControl class >> new [ | r | r := super new. r setHistory. ^r ]
    setHistory [ history := OrderedCollection new ]
    submit: aCommand [ aCommand execute. history addLast: aCommand ]
    undoLast [
        history isEmpty
            ifTrue: [ Transcript showCr: 'nothing to undo' ]
            ifFalse: [ history removeLast undo ]
    ]
]

| light remote |
light := Light new.
remote := RemoteControl new.
remote submit: (LightOnCommand new light: light; yourself).
remote submit: (LightOffCommand new light: light; yourself).
remote undoLast.
remote undoLast.
