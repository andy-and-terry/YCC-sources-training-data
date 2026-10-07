interface FileSystemItem {
    int size()
    void print(String indent)
}

class FileItem implements FileSystemItem {
    String name
    int bytes

    FileItem(String name, int bytes) {
        this.name = name
        this.bytes = bytes
    }

    int size() { return bytes }

    void print(String indent) {
        println "${indent}${name} (${bytes} bytes)"
    }
}

class FolderItem implements FileSystemItem {
    String name
    List<FileSystemItem> children = []

    FolderItem(String name) {
        this.name = name
    }

    void add(FileSystemItem item) {
        children << item
    }

    int size() {
        return children.sum { it.size() } ?: 0
    }

    void print(String indent) {
        println "${indent}${name}/ (${size()} bytes)"
        children.each { it.print(indent + "  ") }
    }
}

def root = new FolderItem("root")
def docs = new FolderItem("docs")
docs.add(new FileItem("readme.txt", 120))
docs.add(new FileItem("notes.txt", 340))

root.add(docs)
root.add(new FileItem("build.gradle", 500))

root.print("")
println "total size: ${root.size()}"
