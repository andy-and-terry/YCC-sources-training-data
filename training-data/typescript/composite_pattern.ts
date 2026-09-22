interface FileSystemNode {
  name: string;
  size(): number;
}

class FileLeaf implements FileSystemNode {
  constructor(public name: string, private bytes: number) {}

  size(): number {
    return this.bytes;
  }
}

class Directory implements FileSystemNode {
  private children: FileSystemNode[] = [];

  constructor(public name: string) {}

  add(node: FileSystemNode): void {
    this.children.push(node);
  }

  size(): number {
    return this.children.reduce((total, child) => total + child.size(), 0);
  }
}

const root = new Directory("root");
const src = new Directory("src");
src.add(new FileLeaf("index.ts", 120));
src.add(new FileLeaf("utils.ts", 80));
root.add(src);
root.add(new FileLeaf("README.md", 40));

console.log(root.size());
