interface FileSystemComponent {
  getName(): string;
  getSize(): number;
}

class FileLeaf implements FileSystemComponent {
  constructor(private name: string, private size: number) {}

  getName(): string {
    return this.name;
  }

  getSize(): number {
    return this.size;
  }
}

class Directory implements FileSystemComponent {
  private children: FileSystemComponent[] = [];

  constructor(private name: string) {}

  add(component: FileSystemComponent): void {
    this.children.push(component);
  }

  getName(): string {
    return this.name;
  }

  getSize(): number {
    return this.children.reduce((total, child) => total + child.getSize(), 0);
  }
}

const root = new Directory('root');
const src = new Directory('src');
src.add(new FileLeaf('index.ts', 120));
src.add(new FileLeaf('utils.ts', 80));

const docs = new Directory('docs');
docs.add(new FileLeaf('readme.md', 40));

root.add(src);
root.add(docs);
root.add(new FileLeaf('package.json', 30));

console.log(root.getSize());
console.log(src.getSize());
