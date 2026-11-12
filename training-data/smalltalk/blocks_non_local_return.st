Object subclass: Finder [
    find: x in: c [ c do: [:e | e = x ifTrue: [^'found']]. ^'missing' ]
]
(Finder new find: 3 in: #(1 2 3)) printNl.
(Finder new find: 9 in: #(1 2 3)) printNl.
