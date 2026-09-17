Object subclass: TrafficLight [
    | state |
    TrafficLight class >> new [
        | t |
        t := super new.
        t setState.
        ^t
    ]
    setState [ state := #red ]
    state [ ^state ]
    next [
        state = #red ifTrue: [ state := #green ].
        state = #green ifTrue: [ state := #yellow ].
        state = #yellow ifTrue: [ state := #red ].
    ]
]

| light |
light := TrafficLight new.
5 timesRepeat: [
    Transcript showCr: light state printString.
    light next.
].
