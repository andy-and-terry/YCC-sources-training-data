Object subclass: RecordingProxy [
    | target log |
    RecordingProxy class >> on: anObject [
        | p |
        p := super new.
        p setTarget: anObject.
        ^p
    ]
    setTarget: anObject [ target := anObject. log := OrderedCollection new ]
    log [ ^log ]
    doesNotUnderstand: aMessage [
        log add: aMessage selector.
        ^target perform: aMessage selector withArguments: aMessage arguments
    ]
]

| proxy result |
proxy := RecordingProxy on: (OrderedCollection new).
proxy add: 1.
proxy add: 2.
proxy add: 3.
result := proxy size.

Transcript showCr: 'result: ', result printString.
Transcript showCr: 'calls made: ', proxy log printString.
