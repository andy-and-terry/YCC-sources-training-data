package main

import "fmt"

type treeType struct {
	name    string
	color   string
	texture string
}

type treeFactory struct {
	cache map[string]*treeType
}

func newTreeFactory() *treeFactory {
	return &treeFactory{cache: make(map[string]*treeType)}
}

func (f *treeFactory) get(name, color, texture string) *treeType {
	key := name + "_" + color + "_" + texture
	if t, ok := f.cache[key]; ok {
		return t
	}
	t := &treeType{name: name, color: color, texture: texture}
	f.cache[key] = t
	fmt.Printf("created new shared treeType for %s\n", key)
	return t
}

func main() {
	factory := newTreeFactory()
	positions := [][2]int{{0, 0}, {5, 5}, {10, 10}}
	for _, pos := range positions {
		t := factory.get("oak", "green", "bark_01")
		fmt.Printf("tree %s at (%d, %d)\n", t.name, pos[0], pos[1])
	}
	fmt.Printf("unique flyweight objects: %d\n", len(factory.cache))
}
