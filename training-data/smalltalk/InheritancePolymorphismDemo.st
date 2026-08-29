Object subclass: Animal [
    | name |
    name: n [ name := n ]
    speak [ ^name, ' makes a sound' ]
]

Animal subclass: Dog [
    speak [ ^name, ' barks' ]
]

| animals |
animals := OrderedCollection new.
animals add: (Animal new name: 'Generic'; yourself).
animals add: (Dog new name: 'Rex'; yourself).
animals do: [ :a | Transcript showCr: a speak ].
