package main

import "fmt"

type editorMemento struct {
	content string
}

type editor struct {
	content string
}

func (e *editor) write(text string) {
	e.content += text
}

func (e *editor) save() editorMemento {
	return editorMemento{content: e.content}
}

func (e *editor) restore(m editorMemento) {
	e.content = m.content
}

type history struct {
	mementos []editorMemento
}

func (h *history) push(m editorMemento) {
	h.mementos = append(h.mementos, m)
}

func (h *history) pop() (editorMemento, bool) {
	if len(h.mementos) == 0 {
		return editorMemento{}, false
	}
	n := len(h.mementos) - 1
	m := h.mementos[n]
	h.mementos = h.mementos[:n]
	return m, true
}

func main() {
	e := &editor{}
	h := &history{}

	e.write("Hello")
	h.push(e.save())
	e.write(", world")
	h.push(e.save())
	e.write("!")

	fmt.Println(e.content)

	if m, ok := h.pop(); ok {
		e.restore(m)
	}
	fmt.Println(e.content)

	if m, ok := h.pop(); ok {
		e.restore(m)
	}
	fmt.Println(e.content)
}
