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
        state = #red ifTrue: [ state := #green. ^self ].
        state = #green ifTrue: [ state := #yellow. ^self ].
        state = #yellow ifTrue: [ state := #red. ^self ]
    ]
]

| light |
light := TrafficLight new.
5 timesRepeat: [
    Transcript showCr: light state printString.
    light next
].
