class FileLeaf {
  constructor(name, size) {
    this.name = name;
    this.size = size;
  }
  getSize() {
    return this.size;
  }
  print(indent = '') {
    console.log(`${indent}${this.name} (${this.size})`);
  }
}

class Directory {
  constructor(name) {
    this.name = name;
    this.children = [];
  }
  add(child) {
    this.children.push(child);
  }
  getSize() {
    return this.children.reduce((sum, c) => sum + c.getSize(), 0);
  }
  print(indent = '') {
    console.log(`${indent}${this.name}/`);
    for (const child of this.children) child.print(indent + '  ');
  }
}

const root = new Directory('root');
const docs = new Directory('docs');
docs.add(new FileLeaf('readme.txt', 10));
docs.add(new FileLeaf('notes.txt', 5));
root.add(docs);
root.add(new FileLeaf('license.txt', 2));
root.print();
console.log('total size:', root.getSize());
module.exports = { FileLeaf, Directory };
