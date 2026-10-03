protocol FileSystemComponent {
    var name: String { get }
    func size() -> Int
}

final class FileLeaf: FileSystemComponent {
    let name: String
    private let byteSize: Int

    init(name: String, byteSize: Int) {
        self.name = name
        self.byteSize = byteSize
    }

    func size() -> Int {
        byteSize
    }
}

final class DirectoryComposite: FileSystemComponent {
    let name: String
    private var children: [FileSystemComponent] = []

    init(name: String) {
        self.name = name
    }

    func add(_ component: FileSystemComponent) {
        children.append(component)
    }

    func size() -> Int {
        children.reduce(0) { $0 + $1.size() }
    }
}

let root = DirectoryComposite(name: "root")
let docs = DirectoryComposite(name: "docs")
docs.add(FileLeaf(name: "readme.txt", byteSize: 120))
docs.add(FileLeaf(name: "notes.txt", byteSize: 340))
root.add(docs)
root.add(FileLeaf(name: "main.swift", byteSize: 980))

print("\(root.name) total size: \(root.size())")
