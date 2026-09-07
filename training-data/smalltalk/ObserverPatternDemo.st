Object subclass: Subject [
    | observers |
    Subject class >> new [
        | s |
        s := super new.
        s setObservers.
        ^s
    ]
    setObservers [ observers := OrderedCollection new ]
    addObserver: obs [ observers add: obs ]
    notifyAll: event [ observers do: [ :obs | obs update: event ] ]
]

Object subclass: LoggingObserver [
    | name |
    name: n [ name := n ]
    update: event [ Transcript showCr: name, ' received: ', event ]
]

| subject obs1 obs2 |
subject := Subject new.
obs1 := LoggingObserver new name: 'Observer1'; yourself.
obs2 := LoggingObserver new name: 'Observer2'; yourself.
subject addObserver: obs1.
subject addObserver: obs2.
subject notifyAll: 'event-fired'.
