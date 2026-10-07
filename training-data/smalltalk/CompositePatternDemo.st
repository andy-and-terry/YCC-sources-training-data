Object subclass: FileSystemNode [
    | name |
    name: n [ name := n ]
    name [ ^name ]
    size [ ^self subclassResponsibility ]
    printIndent: level [ ^(String new: level withAll: $ ) ]
]

FileSystemNode subclass: FileNode [
    | fileSize |
    name: n size: s [ name := n. fileSize := s ]
    size [ ^fileSize ]
    printAt: level [
        Transcript showCr: (self printIndent: level), name, ' (', fileSize printString, ')'
    ]
]

FileSystemNode subclass: DirectoryNode [
    | children |
    DirectoryNode class >> new [
        | d |
        d := super new.
        d setChildren.
        ^d
    ]
    setChildren [ children := OrderedCollection new ]
    add: child [ children add: child ]
    size [ ^children inject: 0 into: [ :sum :each | sum + each size ] ]
    printAt: level [
        Transcript showCr: (self printIndent: level), name, '/ (', self size printString, ')'.
        children do: [ :child | child printAt: level + 2 ]
    ]
]

| root src docs |
root := DirectoryNode new name: 'root'; yourself.
src := DirectoryNode new name: 'src'; yourself.
docs := DirectoryNode new name: 'docs'; yourself.

src add: (FileNode new name: 'main.st' size: 120).
src add: (FileNode new name: 'util.st' size: 80).
docs add: (FileNode new name: 'guide.md' size: 60).
root add: src.
root add: docs.
root add: (FileNode new name: 'README.md' size: 40).

root printAt: 0.
