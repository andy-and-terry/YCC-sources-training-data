import java.util.ArrayList;
import java.util.List;

public class CompositePattern {
    interface FileSystemNode {
        int size();

        String name();
    }

    static class FileLeaf implements FileSystemNode {
        private final String fileName;
        private final int fileSize;

        FileLeaf(String fileName, int fileSize) {
            this.fileName = fileName;
            this.fileSize = fileSize;
        }

        public int size() {
            return fileSize;
        }

        public String name() {
            return fileName;
        }
    }

    static class Directory implements FileSystemNode {
        private final String dirName;
        private final List<FileSystemNode> children = new ArrayList<>();

        Directory(String dirName) {
            this.dirName = dirName;
        }

        void add(FileSystemNode node) {
            children.add(node);
        }

        public int size() {
            return children.stream().mapToInt(FileSystemNode::size).sum();
        }

        public String name() {
            return dirName;
        }
    }

    public static void main(String[] args) {
        Directory root = new Directory("root");
        root.add(new FileLeaf("readme.txt", 100));

        Directory src = new Directory("src");
        src.add(new FileLeaf("Main.java", 250));
        src.add(new FileLeaf("Utils.java", 150));
        root.add(src);

        System.out.println(root.name() + " total size: " + root.size());
    }
}
