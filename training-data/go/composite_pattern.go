package main

import "fmt"

type fileSystemNode interface {
	size() int
	name() string
}

type file struct {
	fileName string
	fileSize int
}

func (f file) size() int     { return f.fileSize }
func (f file) name() string { return f.fileName }

type directory struct {
	dirName  string
	children []fileSystemNode
}

func (d *directory) add(node fileSystemNode) {
	d.children = append(d.children, node)
}

func (d *directory) size() int {
	total := 0
	for _, child := range d.children {
		total += child.size()
	}
	return total
}

func (d *directory) name() string {
	return d.dirName
}

func main() {
	root := &directory{dirName: "root"}
	root.add(file{fileName: "readme.txt", fileSize: 100})

	sub := &directory{dirName: "src"}
	sub.add(file{fileName: "main.go", fileSize: 250})
	sub.add(file{fileName: "utils.go", fileSize: 150})
	root.add(sub)

	fmt.Printf("%s total size: %d\n", root.name(), root.size())
}
