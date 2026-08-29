Object subclass: CircularBuffer [
    | data capacity size start |
    CircularBuffer class >> new: cap [
        | buf |
        buf := self new.
        buf setCapacity: cap.
        ^buf
    ]
    setCapacity: cap [
        capacity := cap.
        data := Array new: cap withAll: 0.
        size := 0.
        start := 0.
    ]
    push: value [
        | index |
        index := (start + size) \\ capacity.
        data at: index + 1 put: value.
        size < capacity
            ifTrue: [ size := size + 1 ]
            ifFalse: [ start := (start + 1) \\ capacity ].
    ]
    toArray [
        | result |
        result := OrderedCollection new.
        0 to: size - 1 do: [ :i | result add: (data at: (start + i) \\ capacity + 1) ].
        ^result
    ]
]

| buf |
buf := CircularBuffer new: 3.
#(1 2 3 4 5) do: [ :v | buf push: v ].
Transcript showCr: buf toArray printString.
