package main

import "fmt"

type cpu struct{}

func (cpu) freeze() { fmt.Println("cpu: freeze") }
func (cpu) jump(pos int) {
	fmt.Println("cpu: jump to", pos)
}
func (cpu) execute() { fmt.Println("cpu: execute") }

type memory struct{}

func (memory) load(pos int, data string) {
	fmt.Println("memory: load", data, "at", pos)
}

type hardDrive struct{}

func (hardDrive) read(sector int, size int) string {
	fmt.Println("hard drive: reading sector", sector)
	return "boot-sector-data"
}

type computerFacade struct {
	cpu   cpu
	mem   memory
	drive hardDrive
}

func newComputerFacade() *computerFacade {
	return &computerFacade{}
}

func (c *computerFacade) start() {
	c.cpu.freeze()
	data := c.drive.read(0, 512)
	c.mem.load(0, data)
	c.cpu.jump(0)
	c.cpu.execute()
}

func main() {
	computer := newComputerFacade()
	computer.start()
}
