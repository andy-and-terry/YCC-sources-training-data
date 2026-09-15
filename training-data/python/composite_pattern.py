from abc import ABC, abstractmethod


class FileSystemNode(ABC):
    @abstractmethod
    def size(self):
        ...

    @abstractmethod
    def display(self, indent=0):
        ...


class File(FileSystemNode):
    def __init__(self, name, size_bytes):
        self.name = name
        self._size = size_bytes

    def size(self):
        return self._size

    def display(self, indent=0):
        print(" " * indent + f"{self.name} ({self._size}b)")


class Directory(FileSystemNode):
    def __init__(self, name):
        self.name = name
        self.children = []

    def add(self, node):
        self.children.append(node)
        return self

    def size(self):
        return sum(child.size() for child in self.children)

    def display(self, indent=0):
        print(" " * indent + f"{self.name}/ ({self.size()}b)")
        for child in self.children:
            child.display(indent + 2)


if __name__ == "__main__":
    root = Directory("root")
    src = Directory("src")
    src.add(File("main.py", 120)).add(File("utils.py", 340))
    root.add(src).add(File("README.md", 50))

    root.display()
    print("total size:", root.size())
