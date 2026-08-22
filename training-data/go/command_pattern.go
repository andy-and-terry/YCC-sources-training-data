package main

import "fmt"

type command interface {
	execute()
	undo()
}

type light struct {
	on bool
}

type turnOnCommand struct {
	light *light
}

func (c *turnOnCommand) execute() {
	c.light.on = true
}

func (c *turnOnCommand) undo() {
	c.light.on = false
}

type commandHistory struct {
	history []command
}

func (h *commandHistory) execute(c command) {
	c.execute()
	h.history = append(h.history, c)
}

func (h *commandHistory) undoLast() {
	if len(h.history) == 0 {
		return
	}
	n := len(h.history) - 1
	h.history[n].undo()
	h.history = h.history[:n]
}

func main() {
	l := &light{}
	history := &commandHistory{}
	history.execute(&turnOnCommand{light: l})
	fmt.Println(l.on)
	history.undoLast()
	fmt.Println(l.on)
}
