Object subclass: FileSystemNode [
    size [ ^self subclassResponsibility ]
    name [ ^self subclassResponsibility ]
]

FileSystemNode subclass: File [
    | name size |
    name: n size: s [ name := n. size := s ]
    name [ ^name ]
    size [ ^size ]
]

FileSystemNode subclass: Directory [
    | name children |
    Directory class >> named: n [
        | d |
        d := self new.
        d setName: n.
        ^d
    ]
    setName: n [ name := n. children := OrderedCollection new ]
    name [ ^name ]
    add: node [ children addLast: node ]
    size [
        | total |
        total := 0.
        children do: [ :c | total := total + c size ].
        ^total
    ]
]

| root src docs |
root := Directory named: 'root'.
src := Directory named: 'src'.
docs := Directory named: 'docs'.

src add: (File new name: 'main.st' size: 120; yourself).
src add: (File new name: 'utils.st' size: 80; yourself).
docs add: (File new name: 'readme.md' size: 40; yourself).

root add: src.
root add: docs.

Transcript showCr: root size printString.
