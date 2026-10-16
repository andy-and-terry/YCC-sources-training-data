package main

import (
	"fmt"
	"path"
	"path/filepath"
)

func main() {
	p := "/usr/local/lib/../bin/tool.tar.gz"
	fmt.Println(filepath.Clean(p))
	fmt.Println(filepath.Dir(p), filepath.Base(p))
	fmt.Println(filepath.Ext(p))
	fmt.Println(filepath.Join("a", "b", "..", "c", "file.txt"))

	dir, file := filepath.Split("/tmp/data/report.csv")
	fmt.Println(dir, file)

	ok, _ := filepath.Match("*.go", "main.go")
	fmt.Println(ok)
	fmt.Println(filepath.IsAbs("rel/path"), path.IsAbs("/abs"))

	rel, _ := filepath.Rel("/a/b", "/a/b/c/d")
	fmt.Println(rel)
}
