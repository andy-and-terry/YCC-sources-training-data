package main

import "fmt"

type monster struct {
	species string
	hp      int
	attack  int
}

func (m monster) clone() monster {
	return monster{species: m.species, hp: m.hp, attack: m.attack}
}

func main() {
	template := monster{species: "Goblin", hp: 20, attack: 5}
	goblin1 := template.clone()
	goblin2 := template.clone()
	goblin2.hp = 15

	fmt.Printf("template hp: %d\n", template.hp)
	fmt.Printf("goblin1 hp: %d, goblin2 hp: %d\n", goblin1.hp, goblin2.hp)
}
