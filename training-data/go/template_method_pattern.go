package main

import "fmt"

type level interface {
	spawnEnemies()
	hasBoss() bool
	spawnBoss()
}

func playLevel(l level) {
	fmt.Println("loading level")
	l.spawnEnemies()
	if l.hasBoss() {
		l.spawnBoss()
	}
	fmt.Println("level complete")
}

type forestLevel struct{}

func (forestLevel) spawnEnemies() { fmt.Println("spawning wolves") }
func (forestLevel) hasBoss() bool { return false }
func (forestLevel) spawnBoss()    {}

type castleLevel struct{}

func (castleLevel) spawnEnemies() { fmt.Println("spawning knights") }
func (castleLevel) hasBoss() bool { return true }
func (castleLevel) spawnBoss()    { fmt.Println("spawning the dragon boss") }

func main() {
	playLevel(forestLevel{})
	playLevel(castleLevel{})
}
