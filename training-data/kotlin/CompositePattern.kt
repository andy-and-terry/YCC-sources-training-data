sealed class FileSystemNode {
    abstract fun totalSize(): Int
}

class FileNode(private val size: Int) : FileSystemNode() {
    override fun totalSize() = size
}

class FolderNode : FileSystemNode() {
    private val children = mutableListOf<FileSystemNode>()

    fun add(child: FileSystemNode) {
        children.add(child)
    }

    override fun totalSize() = children.sumOf { it.totalSize() }
}

fun main() {
    val root = FolderNode()
    val docs = FolderNode()
    docs.add(FileNode(10))
    docs.add(FileNode(5))
    root.add(docs)
    root.add(FileNode(20))
    println("total size: ${root.totalSize()}")
}
