Object subclass: ChatRoom [
    showMessageFrom: aUser message: aMessage [
        Transcript showCr: '[chat] ', aUser name, ': ', aMessage
    ]
]

Object subclass: ChatUser [
    | name room |
    name: n room: r [ name := n. room := r ]
    name [ ^name ]
    send: aMessage [ room showMessageFrom: self message: aMessage ]
]

| room alice bob |
room := ChatRoom new.
alice := ChatUser new name: 'Alice' room: room; yourself.
bob := ChatUser new name: 'Bob' room: room; yourself.

alice send: 'hey bob!'.
bob send: 'hey alice, how are you?'.
