Object subclass: ChatRoom [
    | users |
    init [ users := OrderedCollection new ]
    ChatRoom class >> new [ ^super new init ]
    join: aUser [ users add: aUser. aUser room: self ]
    send: aString from: aUser [
        users do: [ :u | u ~~ aUser ifTrue: [ u receive: aString from: aUser name ] ]
    ]
]

Object subclass: ChatUser [
    | name room |
    name [ ^name ]
    name: aString [ name := aString ]
    room: aRoom [ room := aRoom ]
    say: aString [ room send: aString from: self ]
    receive: aString from: sender [
        Transcript showCr: name, ' got "', aString, '" from ', sender
    ]
]

| room alice bob carol |
room := ChatRoom new.
alice := ChatUser new name: 'Alice'; yourself.
bob := ChatUser new name: 'Bob'; yourself.
carol := ChatUser new name: 'Carol'; yourself.
room join: alice; join: bob; join: carol.
alice say: 'hi all'.
