public class CompositePattern {
    public interface FileSystemComponent {
        Integer getSize();
        String getName();
    }

    public class FileLeaf implements FileSystemComponent {
        private String name;
        private Integer size;
        public FileLeaf(String name, Integer size) {
            this.name = name;
            this.size = size;
        }
        public Integer getSize() {
            return size;
        }
        public String getName() {
            return name;
        }
    }

    public class FolderComposite implements FileSystemComponent {
        private String name;
        private List<FileSystemComponent> children = new List<FileSystemComponent>();
        public FolderComposite(String name) {
            this.name = name;
        }
        public void add(FileSystemComponent component) {
            children.add(component);
        }
        public Integer getSize() {
            Integer total = 0;
            for (FileSystemComponent child : children) {
                total += child.getSize();
            }
            return total;
        }
        public String getName() {
            return name;
        }
    }

    public static void main() {
        FolderComposite root = new FolderComposite('root');
        FolderComposite docs = new FolderComposite('docs');
        docs.add(new FileLeaf('readme.txt', 10));
        docs.add(new FileLeaf('notes.txt', 5));
        root.add(docs);
        root.add(new FileLeaf('image.png', 100));

        System.debug(root.getName() + ': ' + root.getSize());
        System.debug(docs.getName() + ': ' + docs.getSize());
    }
}
